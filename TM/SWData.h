/* SWData.h */
#ifndef SWDATA_H_INCLUDED
#define SWDATA_H_INCLUDED

typedef struct __attribute__((__packed__)) {
  unsigned char SWStat;
  short int Pgain;
  short int Igain;
  short int Pset;
} SWData_t;
extern SWData_t SWData;

#define SWS_PUMP_ON 7
#define SWS_PUMP_OFF 8
#define SWS_CAL_SEQ 9
#define SWS_CAL_RD 10
#define SWS_PUMP_CYCLE 11
#define SWS_PCTRL_ENA 20
#define SWS_PCTRL_DIS 21
#define SWS_TIME_WARP 254

#endif
