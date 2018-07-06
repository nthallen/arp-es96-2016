%{
  #include <stdint.h>
  #include "address.h"
  #include "subbus.h"

  #ifdef SERVER
  /**
   * @param addr subbus address of AO channel
   * @param value the setpoint value in analog units
   * @param scale A multiplier to convert from analog to digital
   * @param min The minimum allowed digital value
   * @param max The maximum allowed digital value
   */
  void set_ao(uint16_t addr, double value, double scale,
      double min, double max) {
    double N = value * scale;
    unsigned short bits;
    if (N > max) N = max;
    if (N < min) N = min;
    bits  = (unsigned short) N;
    sbwr( addr, bits);

  }
  #endif
%}

&command
  : Set &ao_chan %lf (Volts) * {
      double N = $3 * 6553.6;
      unsigned short bits;
      if (N > 32768) N = 32768;
      if (N < 0) N = 0.;
      bits  = (unsigned short) N;
      sbwr( $2, bits);
    }
  : Set Pumps Set Point %lf (Volts) * {
      set_ao(Pump1_V_St_Address, $5, 6553.6, 0., 32768.);
      set_ao(Pump2_V_St_Address, $5, 6553.6, 0., 32768.);
    }
  ;

&ao_chan <unsigned short>
  : Pump 1 Set Point { $0 = Pump1_V_St_Address; }
  : Pump 2 Set Point { $0 = Pump2_V_St_Address; }
  : Laser TEC Set Point { $0 = Laser_TEC_St_Address; }
  : Inlet Temperature Set Point { $0 = InletTSt_Address; }
  : Space Heater Temperature Set Point { $0 = SpHtTSt_Address; }
  : Cell Temperature Set Point { $0 = Cell_T_St_Address; }
  ;
