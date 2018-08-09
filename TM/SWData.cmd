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
  : Algo P2 &AlgoP2 { SWData.AlgoP2 = $3; }
  : Algo P3 &AlgoP3 { SWData.AlgoP3 = $3; }
  : Algo P5 &AlgoP5 { SWData.AlgoP5 = $3; }
  : Algo P7 &AlgoP7 { SWData.AlgoP7 = $3; }
  : Pumps &PumpsSP { SWData.PumpsSP = $2; }
  ;
&SWStat <unsigned char>
  : Calibrate { $0 = SWS_CAL_SEQ; }
  : Set %d { $0 = $2; }
  : Cell Pressure Regulate { $0 = SWS_PCTRL_ENA; }
  : Cell Pressure Deregulate { $0 = SWS_PCTRL_DIS; }
  : Laser Select ICOS and Run { $0 = SWS_QCL_SELICOS; }
  : Laser Select Ring and Run { $0 = SWS_QCL_SELRING; }
  : Laser Start { $0 = SWS_QCL_START; }
  : Laser Stop { $0 = SWS_QCL_STOP; }
  : Laser Disable { $0 = SWS_QCL_DISABLE; }
  : Altitude Drop { $0 = SWS_DROP; }
  : Altitude Stratosphere { $0 = SWS_STRATO; }
  : Altitude Float { $0 = SWS_FLOAT; }
  : Altitude Descent { $0 = SWS_DESCENT; }
  : Altitude Pause { $0 = SWS_DESCENTPAUSE; }
  : Time Warp { $0 = SWS_TIME_WARP; }
  : Shutdown { $0 = SWS_SHUTDOWN; }
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
&AlgoP2 <unsigned char>
  : %d { $0 = $1; }
  ;
&AlgoP3 <unsigned char>
  : %d { $0 = $1; }
  ;
&AlgoP5 <unsigned char>
  : %d { $0 = $1; }
  ;
&AlgoP7 <unsigned char>
  : %d { $0 = $1; }
  ;
&PumpsSP <unsigned char>
  : Set Point %lf (V) { $0 = ($3 > 5) ? 250 : ($3 < 0) ? 0 : $3*50; }
  ;
