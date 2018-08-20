&SWStat <unsigned char>
  : Pump SetPoint Increment { $0 = SWS_PUMP_SP_INC; }
  : Set %d { $0 = $2; }
  : Pump SetPoint Decrement { $0 = SWS_PUMP_SP_DEC; }
  : Calibrate { $0 = SWS_CAL_SEQ; }
  : Inlet SetPoint Increment { $0 = SWS_INLET_SP_INC; }
  : Inlet SetPoint Decrement { $0 = SWS_INLET_SP_DEC; }
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
