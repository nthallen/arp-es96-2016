%{
  #include "SWData.h"
  #ifdef SERVER
    SWData_t SWData;
  #endif
%}

%INTERFACE <SWData:DG/data>

&command
  : &SWTM * { if_SWData.Turf(); }
  ;
&SWTM
  : SWStat &SWStat { SWData.SWStat = $2; }
  : Cell Proportional Gain &Pgain { SWData.Pgain = $4; }
  : Cell Integral Gain &Igain { SWData.Igain = $4; }
  : Cell Pressure &Pset { SWData.Pset = $3; }
  ;
&SWStat <unsigned char>
  : Pump On { $0 = SWS_PUMP_ON; }
  : Set %d { $0 = $2; }
  : Pump Off { $0 = SWS_PUMP_OFF; }
  : Calibrate { $0 = SWS_CAL_SEQ; }
  : RingDown { $0 = SWS_CAL_RD; }
  : Pump Cycle { $0 = SWS_PUMP_CYCLE; }
  : Cell Pressure Regulate { $0 = SWS_PCTRL_ENA; }
  : Cell Pressure Deregulate { $0 = SWS_PCTRL_DIS; }
  : Time Warp { $0 = SWS_TIME_WARP; }
  ;
&Pgain <short int>
  : Set %d { $0 = $2; }
  ;
&Igain <short int>
  : Set %d { $0 = $2; }
  ;
&Pset <short int>
  : Set Point %d (Torr) { $0 = $3; }
  ;
