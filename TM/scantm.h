/** \file scantm.h
 * data_client sub class for telemetry
 */
#ifndef SCANTM_H_INCLUDED
#define SCANTM_H_INCLUDED

#include <stdint.h>
#include "DC.h"
#include "mlf.h"

#ifdef __cplusplus

#define EXTRACTION_INIT DC.init_synch(SYNCHVAL);
#define EXTRACTION_ROW send_row(MFCtr, raw);
#define DATA_CLIENT_CLASS scantm_data_client

typedef struct {
  uint32_t scannum;
  uint16_t scansize;
  uint16_t mfctr_offset;
} __attribute__((packed)) scan_hdr_t;

typedef union {
  scan_hdr_t scan_hdr;
  uint8_t row[0];
} row_buf_t;

class scantm_data_client : public data_client {
  public:
    scantm_data_client(int bufsize_in, int fast = 0, int non_block = 0);
    void init_synch(uint16_t synchval);
    void enqueue_scan(int32_t scannum);
    static scantm_data_client *DCp;
    static void set_port(const char *port);
    static const int max_possible_ssp_size = 49180;
    static const int scanbufsize = max_possible_ssp_size;
    static const int blocksize = 512;
    static const char *tm_port;
    static int baud;
  protected:
    void process_data();
  private:
    int ser_fd, scan_fd;
    int32_t cur_scan;
    int32_t next_scan;
    uint16_t scan_file_size, scan_file_offset;
    uint16_t scan_nb, scan_cp;
    uint16_t scan_mfctr, scan_mfctr_offset;
    mlf_def_t *mlf;
    uint8_t scanbuf[scanbufsize];
    row_buf_t *row_buf;
    uint16_t row_len, row_offset;
    uint16_t Synch, scan_synch;
    uint16_t rows_per_row, rows_this_row;
    
    int flush_row();
    void send_row(uint16_t MFCtr, const unsigned char *raw);
    void send_scan_data();
};

extern "C" {
#endif

/* This is all that is exposed to a C module */
extern void set_scantm_port(const char *port);
extern void set_scantm_baud(int baudrate);
extern void enque_scantm_scan(long scannum);

#ifdef __cplusplus
};
#endif


#endif /* SCANTM_H_INCLUDED */
