#ifndef HCL_SERIN_H_INCLUDED
#define HCL_SERIN_H_INCLUDED

#include <pthread.h>
#include <semaphore.h>
#include <termios.h>
#include "mlf.h"

#ifdef __cplusplus
#include "DGcol.h"
#include "DC.h"

class HCl_serin : public data_generator {
  public:
    HCl_serin(int nQrows, int low_water, const char *path);
    void event(enum dg_event evt);
    void *input_thread();
    void *output_thread();
    void control_loop();
    void service_row_timer();
  protected:
    // void process_tstamp();
    // void process_data();
    // int  process_eof();
    void process_serin();
    void lock(const char *by = 0, int line = -1);
    void unlock();
    void commit_tstamp(mfc_t MFCtr, time_t time);
    const char *context();
    int it_blocked;
    sem_t it_sem;
    int ot_blocked;
    sem_t ot_sem;
    pthread_mutex_t dq_mutex;
    bool have_tstamp;
  private:
    void process_row(const unsigned char *row);
    void process_scan_row(const unsigned char *row);
    void update_termios(int cur_min);
    void dump_bytes(int lvl, int start, int end);
    uint16_t mfcbytes(uint16_t mfc);
    void write_scan_file();
    void nan_fill(uint16_t first_byte, uint16_t last_byte);
    mlf_def_t *mlf;
    int ser_fd;
    termios termios_s;
    bool is_terminal;
    bool have_synch;
    uint16_t next_minor_frame;
    uint16_t synch_lsb, synch_msb;
    uint16_t scan_synch_lsb, scan_synch_msb;
    static const int inbuf_size = 16384;
    static const uint16_t TS_MFC_LIMIT = 32767;
    static const uint32_t NAN32 = 0xFFC00000U;
    uint16_t ROLLOVER_MFC;
    unsigned char inbuf[inbuf_size]; /**< Stores incoming raw telemetry data */
    int cp; /**< Current parsing position in inbuf */
    int nc; /**< Current number of characters in inbuf */
    bool scan_active;
    uint16_t cur_scan;
    uint16_t cur_scansize;
    uint16_t cur_scanmfc_offset;
    uint8_t next_scanmfc;
    uint16_t cur_scan_offset;
    //* Maximum SSP scan file size = (hdr+NS*NC). hdr=7, NS<=4096, NC<=3
    static const int scanbuf_size = 7+4096*3;
    /** scanbuf is sized large enough to contain an entire scan */
    uint32_t scanbuf[scanbuf_size];
    const char *locked_by_file; /**< Source file where current lock was requested */
    int locked_by_line; /**< Source line where current lock was requested */
};

//* Copied from TM/scantm.h
typedef struct {
  uint32_t scannum;
  uint16_t scansize;
  uint16_t mfctr_offset;
} __attribute__((packed)) scan_hdr_t;

//* Copied from sspdrv/ssp_ad.h
typedef struct {
  unsigned short NWordsHdr;
  unsigned short FormatVersion;
  unsigned char  NChannels;
  unsigned char  NF;
  unsigned short NSamples;
  unsigned short NCoadd;
  unsigned short NAvg;
  unsigned short NSkL;
  unsigned short NSkP;
  unsigned long  ScanNum;
  signed short T_HtSink;
  signed short T_FPGA;
} __attribute__((packed)) ssp_scan_hdr_t;

extern "C" {
#endif

  void *input_thread(void *HCl_serin_ptr);
  void *output_thread(void *HCl_serin_ptr);
  void hcl_serin_init( int argc, char **argv );

#ifdef __cplusplus
};
#endif

#define OT_BLOCKED_STOPPED 1
#define OT_BLOCKED_TIME 2
#define OT_BLOCKED_DATA 3
#define IT_BLOCKED_DATA 1
#define IT_BLOCKED_EOF 2

#endif
