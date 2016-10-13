/* SWData.h */
#ifndef SWDATA_H_INCLUDED
#define SWDATA_H_INCLUDED

typedef struct __attribute__((__packed__)) {
  unsigned char SWStat;
} SWData_t;
extern SWData_t SWData;

#define SWS_PUMP_ON 7
#define SWS_PUMP_OFF 8

#endif
