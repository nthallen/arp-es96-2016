TGTDIR = $(TGTNODE)/home/hcl16
Module TMbase

tmcbase = base.tmc
tmcbase = PTRH.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc
tmcbase = T30K75KU.tmc
tmcbase = temps.tmc
tmcbase = TS_T_t_cal.tmc

colbase = AI_col.tmc
colbase = PTRH_col.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc
colbase = temps_col.tmc

cmdbase = /usr/local/share/huarp/phrtg.cmd

genuibase = HCl.genui

Module QCLI

SCRIPT = interact

HClcol : -lsubbus
HCldisp : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc HCl.tbl rtg.tmc \
  /usr/local/share/oui/cic.oui TS.tbl
HClalgo : HCl.tma
doit : HCl.doit
