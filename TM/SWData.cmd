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
  : Algo P1 &AlgoP1 { SWData.AlgoP1 = $3; }
  : Algo P2 &AlgoP2 { SWData.AlgoP2 = $3; }
  : Algo P3 &AlgoP3 { SWData.AlgoP3 = $3; }
  : Algo P5 &AlgoP5 { SWData.AlgoP5 = $3; }
  : Algo P7 &AlgoP7 { SWData.AlgoP7 = $3; }
  : Algo P8 &AlgoP8 { SWData.AlgoP8 = $3; }
  : Pumps &PumpsSP { SWData.PumpsSP = $2; }
  ;
&SWStat <unsigned char>
  : Pump SetPoint Increment { $0 = SWS_PUMP_SP_INC; }
  : Set %d { $0 = $2; }
  : Pump SetPoint Decrement { $0 = SWS_PUMP_SP_DEC; }
  : Calibrate { $0 = SWS_CAL_SEQ; }
  : Inlet SetPoint Increment { $0 = SWS_INLET_SP_INC; }
  : Inlet SetPoint Decrement { $0 = SWS_INLET_SP_DEC; }
  : Cell SetPoint Increment { $0 = SWS_CELL_SP_INC; }
  : Cell SetPoint Decrement { $0 = SWS_CELL_SP_DEC; }
  : Calibrate_Idle { $0 = SWS_CAL_IDLE; }
  : Cell Pressure Regulate { $0 = SWS_PCTRL_ENA; }
  : Cell Pressure Deregulate { $0 = SWS_PCTRL_DIS; }
  : Pinch Valve Reinit { $0 = SWS_PINCH_REINIT; }
  : Laser Select ICOS and Run { $0 = SWS_QCL_SELICOS; }
  : Laser Select Ring and Run { $0 = SWS_QCL_SELRING; }
  : Laser Start { $0 = SWS_QCL_START; }
  : Laser Stop { $0 = SWS_QCL_STOP; }
  : Laser Disable { $0 = SWS_QCL_DISABLE; }
  : Altitude Off Ground { $0 = SWS_OFF_GROUND; }
  : Altitude Stratosphere { $0 = SWS_STRATOSPHERE; }
  : Altitude Float { $0 = SWS_FLOAT; }
  : Altitude Descent { $0 = SWS_VALVEDOWN; }
  : Altitude Pause { $0 = SWS_VALVEDOWNPAUSE; }
  : Altitude Drop { $0 = SWS_TERMINATE; }
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
&AlgoP1 <unsigned char>
  : %d { $0 = $1; }
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
&AlgoP8 <unsigned char>
  : %d { $0 = $1; }
  ;
&PumpsSP <unsigned char>
  : Set Point %lf (V) { $0 = ($3 > 5) ? 250 : ($3 < 0) ? 0 : $3*50; }
  ;
