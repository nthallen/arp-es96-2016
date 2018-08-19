/* SWData.h */
#ifndef SWDATA_H_INCLUDED
#define SWDATA_H_INCLUDED

typedef struct __attribute__((__packed__)) {
  unsigned char SWStat;
  short int Pgain;
  short int Igain;
  short int Pset;
  unsigned char AlgoP1;
  unsigned char AlgoP2;
  unsigned char AlgoP3;
  unsigned char AlgoP5;
  unsigned char AlgoP7;
  unsigned char AlgoP8;
  unsigned char PumpsSP;
} SWData_t;
extern SWData_t SWData;

#define SWS_CAL_SEQ 9
#define SWS_PCTRL_ENA 20
#define SWS_PCTRL_DIS 21
#define SWS_QCL_SELICOS 30
#define SWS_QCL_SELRING 31
#define SWS_QCL_START 32
#define SWS_QCL_STOP 33
#define SWS_QCL_DISABLE 34
#define SWS_DROP 35
#define SWS_STRATO 36
#define SWS_FLOAT 37
#define SWS_DESCENT 38
#define SWS_DESCENTPAUSE 39
#define SWS_TIME_WARP 254
#define SWS_SHUTDOWN 255

#endif
