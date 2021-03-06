/** \file scantm.cc
 * Telemetry transmitter
 */
#include <fcntl.h>
#include <termios.h>
#include <string.h>
#include <errno.h>
#include "scantm.h"
#include "nortlib.h"
#include "nl_assert.h"


scantm_data_client *scantm_data_client::DCp = 0;
const char *scantm_data_client::tm_port = "/dev/ser1";
const char *scantm_data_client::base = "SSP";
int scantm_data_client::baud = 115200;

void set_scantm_port(const char *port) {
  scantm_data_client::tm_port = port;
}

void set_scantm_baud(int baudrate) {
  scantm_data_client::baud = baudrate;
}

void set_scantm_base(const char *baseopt) {
  scantm_data_client::base = baseopt;
}

void enqueue_scantm_scan(long scannum) {
  if (scantm_data_client::DCp) {
    scantm_data_client::DCp->enqueue_scan(scannum);
  }
}

scantm_data_client::scantm_data_client(int bufsize_in, int fast,
      int non_block) :
      data_client(bufsize_in, fast, non_block) {
  ser_fd = open( tm_port, O_WRONLY|O_CREAT, 0664 );
  if ( ser_fd < 0 ) {
    nl_error( 3,
      "Error %d opening telemetry port %s: %s", errno, tm_port,
      strerror(errno)
    );
  } else {
    struct termios termios_p;

    if ( tcgetattr( ser_fd, &termios_p) ) {
      if (errno == ENOTTY) {
        nl_error(1, "%s is not a serial port", tm_port);
      } else {
        nl_error( 2, "Error on tcgetattr: %s", strerror(errno) );
      }
    } else {
      termios_p.c_iflag = 0;
      termios_p.c_lflag &= ~(ECHO|ICANON|ISIG|ECHOE|ECHOK|ECHONL);
      termios_p.c_cflag = CLOCAL|CREAD|CS8;
      termios_p.c_cflag &= ~HUPCL;
      termios_p.c_oflag &= ~(OPOST|ONLCR);
      termios_p.c_ispeed = termios_p.c_ospeed = baud;
      if ( tcsetattr(ser_fd, TCSANOW, &termios_p) )
        nl_error( 2, "Error on tcsetattr: %s", strerror(errno) );
    }
  }

  scan_fd = -1;
  cur_scan = next_scan = 0;
  scan_nb = scan_cp = 0;
  scan_mfctr = scan_mfctr_offset = 0;
  // Could add option to find scans in another directory, etc.
  mlf = mlf_init(3, 60, 0, base, "dat", NULL);

  DCp = this;

  row_len = tm_info.tm.nbminf;
  row_buf = (row_buf_t *)nl_new_memory(row_len);
  row_offset = row_len;
  Synch = 0;
  rows_per_row = (tm_info.tm.nsecsper * baud) /
        (tm_info.tm.nrowsper * tm_info.tm.nbminf * 10);
}

void scantm_data_client::init_synch(uint16_t synchval) {
  Synch = synchval;
  scan_synch = ~synchval;
}

/**
 * @param MFCtr
 * @param raw The raw homerow data without the leading MFCtr or
 *    trailing Synch
 * @param Synch
 */
void scantm_data_client::send_row(unsigned short MFCtr,
                                  const unsigned char *raw) {
  if (flush_row()) return; // abandon data
  rows_this_row = 0;
  memcpy(&(row_buf->row[0]), &MFCtr, 2);
  memcpy(&(row_buf->row[2]), raw, tm_info.tm.nbminf-4);
  memcpy(&(row_buf->row[row_len-2]), &Synch, 2);
  row_offset = 0;
  if (flush_row()) return;
  send_scan_data();
}

/**
 * @return non-zero if the row did not empty completely
 */
int scantm_data_client::flush_row() {
  if (row_offset < row_len) {
    int nb = row_len - row_offset;
    int rv = write(ser_fd, &row_buf->row[row_offset], nb);
    if (rv < 0) {
      nl_error(3, "Error %d from write", errno);
    } else if (rv < nb) {
      row_offset += rv;
      nl_error(1, "Output buffer filled after %d/%d rows",
        rows_this_row, rows_per_row);
      rows_per_row = rows_this_row;
      return 1;
    } else {
      row_offset = row_len;
      ++rows_this_row;
    }
  }
  return 0;
}

void scantm_data_client::enqueue_scan(int32_t scannum) {
  next_scan = scannum;
}

/**
 */
void scantm_data_client::send_scan_data() {
  while (rows_this_row < rows_per_row) {
    if (cur_scan == 0) {
      if (next_scan == 0) return;
      cur_scan = next_scan;
      next_scan = 0;
      mlf_set_index(mlf, cur_scan);
      scan_fd = mlf_next_fd(mlf);
      nl_error(MSG_DBG(0), "Reading scan %lu from path %s",
        cur_scan, mlf->fpath);
      if (scan_fd < 0) { // error is already reported
        cur_scan = 0;
        return;
      }
      scan_file_size = lseek(scan_fd, 0, SEEK_END);
      if (scan_file_size < 0 || lseek(scan_fd, 0, SEEK_SET) != 0) {
        nl_error(2, "Error getting scan %d length");
        close(scan_fd);
        scan_fd = -1;
        cur_scan = 0;
        return;
      }
      if (scan_file_size > scanbufsize) {
        nl_error(MSG_ERROR, "Scan %d size %lu exceeds max possible %d",
          cur_scan, scan_file_size, scanbufsize);
        close(scan_fd);
        scan_fd = -1;
        cur_scan = 0;
        return;
      }
      int rv = ::read(scan_fd, scanbuf, scan_file_size);
      if (rv < 0) {
        nl_error(MSG_ERROR, "Error %d reading scan %d", errno, cur_scan);
        close(scan_fd);
        scan_fd = -1;
        cur_scan = 0;
        return;
      }
      scan_nb = rv;
      if (rv < scan_file_size) {
        nl_error(MSG_WARN, "Short read on scan %d: %d/%d",
            cur_scan, rv, scan_file_size);
      }
      ssp_hdr = (ssp_scan_hdr_t *)scanbuf;
      int chk_size = sizeof(uint32_t)*(7+ssp_hdr->NChannels*ssp_hdr->NSamples);
      if (chk_size > scan_file_size) {
        nl_error(MSG_ERROR, "Scan file %d is short: %d/%d",
          cur_scan, scan_file_size, chk_size);
        close(scan_fd);
        scan_fd = -1;
        cur_scan = 0;
        return;
      } else if (chk_size < scan_file_size) {
        nl_error(MSG_DBG(0), "Scan file %d is long: %d/%d",
          cur_scan, scan_file_size, chk_size);
        scan_file_size = chk_size;
        if (scan_nb > scan_file_size)
          scan_nb = scan_file_size;
      }
      nl_error(MSG_DBG(0), "Transmitting scan %ld: %lu bytes",
        cur_scan, scan_file_size);
      scan_cp = 0;
      scan_mfctr = 0;
      scan_mfctr_offset = 1;
      scan_file_offset = scan_nb;
    }
    if (flush_row()) return;
    if (scan_mfctr < scan_mfctr_offset ||
        scan_mfctr > scan_mfctr_offset + 255) {
      // create a header
      scan_mfctr_offset = scan_mfctr;
      // row_buf->scan_hdr.scannum = cur_scan;
      // row_buf->scan_hdr.scansize = scan_file_size;
      // row_buf->scan_hdr.mfctr_offset = scan_mfctr++;
      // memset(&row_buf->row[sizeof(scan_hdr_t)], 0,
        // row_len-sizeof(scan_hdr_t)-3);
      // row_buf->row[row_len-3] = 0;
      // memcpy(&(row_buf->row[row_len-2]), &scan_synch, 2);
      // row_offset = 0;
      // if (flush_row()) return;
    }
    if (scan_nb - scan_cp < row_len-3 &&
        scan_file_offset < scan_file_size) {
      // Less than one row of data currently in scanbuf and
      // more data left in the file, so read in more.
      if (scan_nb > scan_cp && scan_cp > 0) {
        memmove(&(row_buf->row[0]), &(row_buf->row[scan_cp]), scan_nb-scan_cp);
        scan_nb -= scan_cp;
        scan_cp = 0;
      }
      int remaining = scan_file_size - scan_file_offset;
      int available = scanbufsize - scan_cp;
      if (remaining > available) {
        if (available > blocksize) {
          // round down to fixed number of blocks
          int blocks = available/blocksize;
          remaining = blocks*blocksize;
        } else {
          remaining = available;
          // This should really never happen. It would mean the
          // scanbufsize is not much bigger than the blocksize
        }
      }
      int rv = ::read(scan_fd, scanbuf+scan_cp, remaining);
      scan_nb += rv;
      scan_file_offset += rv;
    }
    if (scan_cp >= scan_nb) {
      nl_assert(scan_file_offset >= scan_file_size);
      nl_assert(scan_fd >= 0);
      close(scan_fd);
      scan_fd = -1;
      cur_scan = 0;
    } else {
      uint16_t row_mfc = scan_mfctr++ - scan_mfctr_offset;
      uint16_t hdr_offset = 0;
      // transmit a row
      int available = scan_nb - scan_cp;
      if (row_mfc == 0) {
        row_buf->scan_hdr.scannum = cur_scan;
        row_buf->scan_hdr.scansize = scan_file_size;
        row_buf->scan_hdr.mfctr_offset = scan_mfctr_offset;
        hdr_offset = sizeof(scan_hdr_t);
      }
      if (available >= row_len-3-hdr_offset) {
        available = row_len - 3 - hdr_offset;
        memcpy(&(row_buf->row[hdr_offset]), &scanbuf[scan_cp], available);
      } else {
        memcpy(&(row_buf->row[hdr_offset]), &scanbuf[scan_cp], available);
        memset(&(row_buf->row[hdr_offset+available]), 0,
          row_len - 3 - available - hdr_offset);
      }
      row_buf->row[row_len-3] = row_mfc;
      memcpy(&(row_buf->row[row_len-2]), &scan_synch, 2);
      scan_cp += available;
      row_offset = 0;
      if (flush_row()) return;
    }
  }
}
