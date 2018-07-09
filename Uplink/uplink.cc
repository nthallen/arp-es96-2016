#include <Selector.h>
#include "oui.h"
#include "uplink.h"

const char *uplink_path;

UplinkCmd::~UplinkCmd() {}

int UplinkCmd::ProcessData(int flag) {
  // check that flags is just set to Selector::Sel_Read
  // Parse W:XX\n or exit on no data
  nc = cp = 0;
  fillbuf();
  if (nc == 0) return 1;
  if (not_str("W:") || not_hex(&cmd) || not_str("\n")) {
    report_err("Syntax error at column %d", cp);
  } else {
    US->transmit(cmd);
  }
  return 0;
}

UplinkSer::UplinkSer(const char *port, const char *addr) :
          Ser_Sel(port, O_RDWR, 80), addr(addr) {
  // ### Verify that addr is non-zero and consists of
  // ### exactly 2 hex digits
  flags = Selector::Sel_Read | Selector::Sel_Write;
}

UplinkSer::~UplinkSer() {}

int UplinkSer::ProcessData(int flag) {
  // ### Implement
}

void UplinkSer::transmit(unsigned char val) {
  // ### Implement
}

int main(int argc, char **argv) {
  oui_init_options(argc, argv);
  nl_error(0, "Starting V1.0");
  { Selector S;
    UplinkSer US(uplink_path);
    US.setup(1200, 8, 'N', 1, 1, 1);
    UplinkCmd UC(&US);
    S.add_child(&UC);
    S.add_child(&US);
    S.event_loop();
  }
  nl_error(0, "Terminating");
}
