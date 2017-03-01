%INTERFACE <SSP>
%INTERFACE <QCLI>

%{

#ifdef SERVER
  #include "hsatod.h"
  #include "qclisspcmd.h"
  #define QCLI_AB3R 1
  #ifdef QCLI_ABC3R
    #define QCLI_ICOS \
        (HSAD_OPT_A|HSAD_OPT_B|HSAD_OPT_C|HSAD_TRIG_3|HSAD_TRIG_RISING)
  #endif
  #ifdef QCLI_AB3R
    #define QCLI_ICOS \
        (HSAD_OPT_A|HSAD_OPT_B|HSAD_TRIG_3|HSAD_TRIG_RISING)
  #endif
  #define QCLI_RINGDOWN QCLI_ICOS
  hsatod_setup_t SSP_setup;

  qclissp_t SSP_cmd = { &SSP_setup, &if_SSP };
#endif

%}
# &SSP returns a pointer to a two-element structure
&SSP <qclissp_t *>
  : SSP { $0 = &SSP_cmd; }
  ;
# &QCLI returns an inteface
&QCLI <cmdif_rd *>
  : QCLI { $0 = &if_QCLI; }
  ;
&command
  : Select QCLI Waveform &QCLI_Wave * {
      SSP_setup = QCLI_Waves[$4];
      if_QCLI.Turf( "SW:%d\n", $4 );
    }
  ;
