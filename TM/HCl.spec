TGTDIR = $(TGTNODE)/home/hcl16

tmcbase = base.tmc

cmdbase = /usr/local/share/huarp/phrtg.cmd

genuibase = HCl.genui

Module TMbase

SCRIPT = interact

HCldisp : HCl.tbl rtg.tmc
HClalgo : HCl.tma
doit : HCl.doit
