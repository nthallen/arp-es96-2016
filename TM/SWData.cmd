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
  ;
&SWStat <unsigned char>
  : Pump On { $0 = SWS_PUMP_ON; }
  : Set %d { $0 = $2; }
  : Pump Off { $0 = SWS_PUMP_OFF; }
  ;
