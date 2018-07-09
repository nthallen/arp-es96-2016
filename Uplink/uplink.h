#ifndef UPLINK_H_INCLUDED
#define UPLINK_H_INCLUDED

extern const char *uplink_port;

#ifdef __cplusplus
#include <SerSelector.h>

class UplinkCmd : public Cmd_Selectee {
  public:
    inline UplinkCmd(UplinkSer *US) : Cmd_Selectee("cmd/uplink"), US(US) {};
    ~UplinkCmd();
    int ProcessData(int flag);
  private:
    UplinkSer *US;
};

class UplinkSer : public SerSelectee {
  public:
    UplinkSer(const char *port, const char *addr);
    ~UplinkSer();
    int ProcessData(int flag);
    void transmit(unsigned char val);
  private:
    const char *addr;
};

#endif

#endif
