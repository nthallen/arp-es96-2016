TGTDIR = $(TGTNODE)/home/hcl16

tmcbase = base.tmc
tmcbase = PTRH.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc
tmcbase = T30K75KU.tmc
tmcbase = temps.tmc
tmcbase = AmbTS_T_t_cal.tmc
tmcbase = TS_T_t_cal.tmc
tmcbase = RPM.tmc
tmcbase = idx.tmc
tmcbase = pwrmon.tmc
tmcbase = /usr/local/share/huarp/vl_temp.tmc
tmcbase = /usr/local/share/huarp/ebx11_temp.tmc

colbase = AI_col.tmc
colbase = PTRH_col.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc
colbase = temps_col.tmc
colbase = RPM_col.tmc
colbase = idxcol.tmc
colbase = /usr/local/share/huarp/DACS_ID.tmc
colbase = /usr/local/share/huarp/vl_temp_col.tmc

cmdbase = /usr/local/share/huarp/phrtg.cmd
cmdbase = ao.cmd
cmdbase = digio.cmd
cmdbase = address.h
cmdbase = /usr/local/share/huarp/DACS_AI.cmd
cmdbase = /usr/local/share/huarp/idx64.cmd
cmdbase = idxdrv.cmd

genuibase = HCl.genui
genuibase = idx.genui
genuibase = temps.genui
genuibase = PTRH.genui
genuibase = RPM.genui
genuibase = pwrmon.genui
extbase = VigoT.tmc temps_conv.tmc PTRH_conv.tmc
swsbase = HCl.sws

Module TMbase
Module QCLI mode=amp RESET= SSPRATE=4
Module Telemetry

DISTRIB = SerIn/hclsisrvr SerIn/hclsiclt SerIn/hclsicltnc
SCRIPT = interact
SCRIPT = digio.dccc
SCRIPT = idx.idx64
SRCDIST = SSP_xform.m
IGNORE = Makefile

HClcol : -lsubbus
HClsrvr : -lsubbus
HCldisp : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc idxflag.tmc \
  dstat_conv.tmc pwrmon_conv.tmc VigoT.tmc HCl.tbl HCl2.tbl \
  /usr/local/share/oui/cic.oui
HClalgo : HCl.tma HCl.sws
HClrtgext : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc \
  dstat_conv.tmc pwrmon_conv.tmc rtg.tmc \
  /usr/local/share/oui/cic.oui
ssprtgext : ssprtg.tmc
scantmext : scantm.cc scantm.oui scantm.tmc
doit : HCl.doit
%%
COLFLAGS = -Haddress.h
address.h : HClcol.cc
SerIn/hclsisrvr SerIn/hclsiclt SerIn/hclsicltnc :
	cd SerIn && make
clean-dist : clean-SerIn
.PHONY : clean-SerIn
clean-SerIn :
	cd SerIn && make clean
