TGTDIR = $(TGTNODE)/home/hcl16

tmcbase = base.tmc
tmcbase = PTRH.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc
tmcbase = T30K75KU.tmc
tmcbase = temps.tmc
tmcbase = TS_T_t_cal.tmc
tmcbase = RPM.tmc
tmcbase = idx.tmc

colbase = AI_col.tmc
colbase = PTRH_col.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc
colbase = temps_col.tmc
colbase = RPM_col.tmc
colbase = idxcol.tmc

cmdbase = /usr/local/share/huarp/phrtg.cmd
cmdbase = ao.cmd
cmdbase = address.h
cmdbase = /usr/local/share/huarp/DACS_AI.cmd
cmdbase = /usr/local/share/huarp/idx64.cmd
cmdbase = idxdrv.cmd

genuibase = HCl.genui
genuibase = idx.genui
genuibase = temps.genui
genuibase = PTRH.genui
genuibase = RPM.genui
extbase = temps_conv.tmc PTRH_conv.tmc
swsbase = HCl.sws

Module TMbase
Module QCLI RESET=

SCRIPT = interact
SCRIPT = digio.dccc
SCRIPT = idx.idx64
SRCDIST = SSP_xform.m
IGNORE = Makefile

HClcol : -lsubbus
HClsrvr : -lsubbus
HCldisp : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc idxflag.tmc \
  dstat_conv.tmc HCl.tbl HCl2.tbl rtg.tmc \
  /usr/local/share/oui/cic.oui
HClalgo : HCl.tma HCl.sws
doit : HCl.doit
%%
COLFLAGS = -Haddress.h
address.h : HClcol.cc
