TGTDIR = $(TGTNODE)/home/hcl16

tmcbase = base.tmc

cmdbase = /usr/local/share/huarp/phrtg.cmd

genuibase = HCl.genui

Module TMbase
Module QCLI

SCRIPT = interact

HClcol : -lsubbus
HCldisp : QCLI_conv.tmc HCl.tbl rtg.tmc
HClalgo : HCl.tma
doit : HCl.doit
