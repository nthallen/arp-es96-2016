%{
  #include <stdint.h>
  #include "subbus.h"

  #ifdef SERVER
  void mks_analog_set_point(uint16_t addr, double Fset, double F_FS,
              double V_max, double V_zero, double G_DACS) {
    Fset = Fset > F_FS ? F_FS : Fset < 0 ? 0 : Fset;
    double Vset = Fset * (V_max-V_zero) / F_FS + V_zero;
    double Dset = Vset * 65536. / (2.5 * G_DACS);
    Dset = Dset > 65535. ? 65535. : Dset < 0 ? 0 : Dset;
    uint16_t bits = (uint16_t) Dset;
    sbwr(addr, bits);
  }
  #endif
%}
%INTERFACE <MKS>

&command
  : HCl Flow SetPoint %f (sccm) sccm * { if_MKS.Turf("W1:1:%.4f\n", $4); }
  : Air Flow SetPoint %f (sccm) sccm * { mks_analog_set_point(0x402, $4, 50000, 5, 0, 2); }
  ;
