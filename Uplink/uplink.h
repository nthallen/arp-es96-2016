#ifndef UPLINK_H_INCLUDED
#define UPLINK_H_INCLUDED

extern const char *uplink_port;
extern const char *uplink_addr0, *uplink_addr1;

#ifdef __cplusplus
#include <SerSelector.h>

class UplinkSer : public Ser_Sel {
  public:
    UplinkSer(const char *port, const char *addr0, const char *addr1);
    ~UplinkSer();
    int ProcessData(int flag);
    void transmit(unsigned short addr, unsigned short val);
  private:
    unsigned short addr0, addr1;
};

class UplinkCmd : public Cmd_Selectee {
  public:
    inline UplinkCmd(UplinkSer *US) : Cmd_Selectee("cmd/uplink", 80), US(US) {};
    ~UplinkCmd();
    int ProcessData(int flag);
  private:
    UplinkSer *US;
};

#endif

#endif
