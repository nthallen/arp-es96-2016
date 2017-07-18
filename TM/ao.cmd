%{
  #include "address.h"
  #include "subbus.h"
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
  ;

&ao_chan <unsigned short>
  : Pump 1 Set Point { $0 = Pump1_V_St_Address; }
  : Pump 2 Set Point { $0 = Pump2_V_St_Address; }
  : Laser TEC Set Point { $0 = Laser_TEC_St_Address; }
  : Inlet Temperature Set Point { $0 = InletTSt_Address; }
  : Space Heater Temperature Set Point { $0 = SpHtTSt_Address; }
  : Cell Temperature Set Point { $0 = Cell_T_St_Address; }
  ;
