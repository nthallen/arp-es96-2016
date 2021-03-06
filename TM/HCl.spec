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
tmcbase = algo_conv.tmc

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
extbase = model_atmos.cc TM_lowpass.cc climb_rate.tmc
extbase = GasP_conv.tmc
extbase = HUSCE_CT.tmc
swsbase = HCl.sws

Module TMbase
Module QCLI mode=noise RESET= SSPRATE=4
Module Telemetry
Module mksflow src=mksflow.txt name=MKS

DISTRIB = SerIn/hclsisrvr SerIn/hclsiclt SerIn/hclsicltnc
DISTRIB = ../Uplink/uplink ../Uplink/uplink_rcvr
SCRIPT = interact
SCRIPT = digio.dccc
SCRIPT = idx.idx64
# SRCDIST = SSP_xform.m
IGNORE = Makefile

HClcol : -lsubbus
HClsrvr : -lsubbus
HCldisp : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc idxflag.tmc \
  GasP_conv.tmc HUSCE_CT.tmc \
  dstat_conv.tmc pwrmon_conv.tmc VigoT.tmc HCl.tbl HCl2.tbl HCl3.tbl \
  model_atmos.cc TM_lowpass.cc climb_rate.tmc \
  algo.tbl /usr/local/share/oui/cic.oui
HClalgo : model_atmos.cc TM_lowpass.cc climb_rate.tmc HCl.tma HCl.sws
HClrtgext : QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc \
  dstat_conv.tmc pwrmon_conv.tmc model_atmos.cc TM_lowpass.cc \
  climb_rate.tmc GasP_conv.tmc HUSCE_CT.tmc rtg.tmc \
  /usr/local/share/oui/cic.oui
ssprtgext : ssprtg.tmc
scantmext : scantm.cc scantm.oui scantm.tmc
doit : HCl.doit
%%
COLFLAGS = -Haddress.h
address.h : HClcol.cc

.PHONY : all-SerIn clean-SerIn
all-dist : all-SerIn
all-SerIn :
	cd SerIn && make
SerIn/hclsisrvr SerIn/hclsiclt SerIn/hclsicltnc :
	cd SerIn && make
clean-dist : clean-SerIn
clean-SerIn :
	cd SerIn && make clean

.PHONY : all-Uplink clean-Uplink
all-dist : all-Uplink
all-Uplink :
	cd ../Uplink && make
../Uplink/uplink ../Uplink/uplink_rcvr :
	cd ../Uplink && make
clean-dist : clean-Uplink
clean-Uplink :
	cd ../Uplink && make clean

model_atmos.o : model_atmos.h
TM_lowpass.o : TM_lowpass.h

distribution : distribution-serin
distribution-serin :
	@[ -d $(TGTDIR)/SerIn ] || mkdir $(TGTDIR)/SerIn
	@for i in VERSION bin doit src; do ln -fs ../$$i $(TGTDIR)/SerIn/$$i; done
	@distribute $(FORCE) $(TGTDIR)/SerIn SerIn/Experiment.config

