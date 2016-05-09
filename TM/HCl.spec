TGTDIR = $(TGTNODE)/home/hcl16
Module TMbase

tmcbase = base.tmc
tmcbase = PTRH.tmc
tmcbase = /usr/local/share/huarp/ptrhm.cc

colbase = AI_col.tmc
colbase = PTRH_col.tmc
colbase = /usr/local/share/huarp/ptrhm_col.cc

cmdbase = /usr/local/share/huarp/phrtg.cmd

genuibase = HCl.genui

Module QCLI

SCRIPT = interact

HClcol : -lsubbus
HCldisp : QCLI_conv.tmc PTRH_conv.tmc HCl.tbl rtg.tmc \
  /usr/local/share/oui/cic.oui
HClalgo : HCl.tma
doit : HCl.doit
