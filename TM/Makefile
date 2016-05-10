# Invoking: appgen_module TMbase X 
# Invoking: appgen_module QCLI X 
# Makefile Generated Mon May 09 21:51:29 EDT 2016
MNC=HCl
SPECFILE=HCl.spec
PCMFILE=HCl.pcm
SRC=freemem.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc
SRC+=TS_T_t_cal.tmc QCLI.tmc waves.tmc AI_col.tmc PTRH_col.tmc
SRC+=temps_col.tmc QCLI_col.tmc QCLI_conv.tmc PTRH_conv.tmc
SRC+=temps_conv.tmc HCl.tbl rtg.tmc TS.tbl HCl.tma HCl.doit QCLI.cmd
SRC+=waves.cmd TMbase.genui HCl.genui QCLI.genui
TOOL=HCl.spec Makefile
SCRIPT=interact
OBJ=waves.cmd waves.out waves.tmc waves.m waves.log HClcol.cc
OBJ+=HCl.pcm tm.dac HClcoloui.c HClcoloui.o HClcol.o ptrhm.o
OBJ+=ptrhm_col.o HCltbl.tmc TStbl.tmc HCldisp.cc HCldispoui.c
OBJ+=HCldispoui.o HCldisp.o HCltblnc.tmc TStblnc.tmc HCldispnc.cc
OBJ+=HCldispncoui.c HCldispncoui.o HCldispnc.o HClalgoa.tmc
OBJ+=HClalgo.cc HClalgooui.c HClalgooui.o HClalgo.o doit.dep
OBJ+=HClcmd.cc HClcmd.dat HClclt.o HClcltoui.c HClcltoui.o HClcltnc.o
OBJ+=HClcltncoui.c HClcltncoui.o HClsrvr.o HClsrvroui.c HClsrvroui.o
OBJ+=HClengext.cdf HClengextcdf.oui HClengextcdf.tmc HClengext.cc
OBJ+=HClengextoui.c HClengextoui.o HClengext.o HCltbl.tmc.dep
OBJ+=TStbl.tmc.dep HCltblnc.tmc.dep TStblnc.tmc.dep
TGT=HClcol HCldisp HCldispnc HClalgo doit HClclt HClcltnc HClsrvr
TGT+=HClengext
DISTRIB=waves.out HCl.pcm tm.dac
IDISTRIB=Experiment.config VERSION doit
SRCDIST=waves.m waves.qcli HCl.tbl TS.tbl HCl.tma
SRCDIST+=/usr/local/share/huarp/tdrift.tmc
SRCDIST+=/usr/local/share/huarp/cpu_usage.tmc
SRCDIST+=/usr/local/share/huarp/tmdf.tmc freemem.tmc
SRCDIST+=/usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc
SRCDIST+=/usr/local/share/huarp/ptrhm.cc T30K75KU.tmc temps.tmc
SRCDIST+=TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc
SRCDIST+=QCLI.tmc waves.tmc
TMCBASE=/usr/local/share/huarp/tdrift.tmc
TMCBASE+=/usr/local/share/huarp/cpu_usage.tmc
TMCBASE+=/usr/local/share/huarp/tmdf.tmc freemem.tmc
TMCBASE+=/usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc
TMCBASE+=/usr/local/share/huarp/ptrhm.cc T30K75KU.tmc temps.tmc
TMCBASE+=TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc
TMCBASE+=QCLI.tmc waves.tmc
CMDBASE=/usr/local/share/huarp/root.cmd
CMDBASE+=/usr/local/share/huarp/getcon.cmd
CMDBASE+=/usr/local/share/huarp/phrtg.cmd
CMDBASE+=/usr/local/share/huarp/qclia.cmd QCLI.cmd waves.cmd
COLBASE=/usr/local/share/huarp/tdrift_col.tmc
COLBASE+=/usr/local/share/huarp/cpu_usage_col.tmc
COLBASE+=/usr/local/share/huarp/tmdf_col.tmc
COLBASE+=/usr/local/share/huarp/freemem_col.tmc AI_col.tmc
COLBASE+=PTRH_col.tmc /usr/local/share/huarp/ptrhm_col.cc
COLBASE+=temps_col.tmc QCLI_col.tmc
SWSBASE=
QCLIBASE=waves.qcli
SPECDEPBASE=/usr/local/share/huarp/TMbase.agm
SPECDEPBASE+=/usr/local/share/huarp/freemem_def.tmc.in
SPECDEPBASE+=/usr/local/share/huarp/TMbase.genui.in
SPECDEPBASE+=/usr/local/share/huarp/TMbase.tbl.in
SPECDEPBASE+=/usr/local/share/huarp/QCLI.agm
SPECDEPBASE+=/usr/local/share/huarp/qcli.tmc.in
SPECDEPBASE+=/usr/local/share/huarp/qcli_col.tmc.in
SPECDEPBASE+=/usr/local/share/huarp/qclis.cmd.in
SPECDEPBASE+=/usr/local/share/huarp/qcli_conv.tmc.in
SPECDEPBASE+=/usr/local/share/huarp/qcli.genui.in
SPECDEPBASE+=/usr/local/share/huarp/qcli.tbl.in
AG_CPPFLAGS=
PHTGT=HCltbl.tmc TStbl.tmc
RCS=$(SRC) $(TOOL) $(SCRIPT)
SOURCE=$(RCS) $(NONRCS)
OBJECT=$(OBJ) *.err
TARGET=$(TGT)
DSTRB=$(TGT) $(DISTRIB) $(SCRIPT)
TGTDIR= $(TGTNODE)/home/hcl16
include /usr/local/share/huarp/appgen.mk

.PHONY : all all-dist extdistribution distribution clean clean-dist check_photon

IGNOREFILE=.gitignore
all : Makefile check_photon $(TGT) $(IGNOREFILE)
all-dist : $(DSTRB) $(SRCDIST) VERSION
Makefile : HCl.spec $(SPECDEPBASE)
	appgen HCl.spec
VERSION=`cat VERSION`
extdistribution : $(DSTRB) $(SRCDIST) VERSION
	@[ -d $(TGTDIR)/bin ] || mkdir $(TGTDIR)/bin
	@[ -d $(TGTDIR)/bin/$(VERSION) ] || mkdir $(TGTDIR)/bin/$(VERSION)
	@[ -d $(TGTDIR)/bin/$(VERSION)/Base ] || mkdir $(TGTDIR)/bin/$(VERSION)/Base
	@[ ! -f $(TGTDIR)/bin/$(VERSION)/$(PCMFILE) ] || \
	  cmp -s $(TGTDIR)/bin/$(VERSION)/$(PCMFILE) $(PCMFILE) || \
	  ( echo "$(PCMFILE) changed without VERSION update"; false )
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION) $(DSTRB)
	@distribute $(FORCE) $(TGTDIR)/bin/$(VERSION)/Base $(SRCDIST)
distribution : extdistribution
	@distribute $(FORCE) $(TGTDIR) $(IDISTRIB)
check_photon :
ifeq ($(WPHOTON),YES)
	@for tgt in $(PHTGT); do \
	  cmp -s $$tgt /usr/local/share/huarp/nulltbl.tmc && echo Remaking $$tgt && rm -f $$tgt; \
	done; true
endif
HClcol : HClcol.o ptrhm.o ptrhm_col.o HClcoloui.o
	$(LINK.privCXX) HClcol.o ptrhm.o ptrhm_col.o HClcoloui.o -lsubbus -ltmpp -ltm -lnort
	$(OUIUSE) HClcoloui.c
	$(PROMOTE) HClcol
HCldisp : HCldisp.o ptrhm.o HCldispoui.o
	$(LINK.normCXX) HCldisp.o ptrhm.o HCldispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HCldispoui.c
HCldispnc : HCldispnc.o ptrhm.o HCldispncoui.o
	$(LINK.normCXX) HCldispnc.o ptrhm.o HCldispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HCldispncoui.c
HClalgo : HClalgo.o ptrhm.o HClalgooui.o
	$(LINK.normCXX) HClalgo.o ptrhm.o HClalgooui.o -ltmpp -ltm -lnort
	$(OUIUSE) HClalgooui.c
doit : HCl.doit
	mkdoit3 -o doit  HCl.doit
HClclt : HClclt.o HClcltoui.o
	$(LINK.normCXX) HClclt.o HClcltoui.o -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HClcltoui.c
HClcltnc : HClcltnc.o HClcltncoui.o
	$(LINK.normCXX) HClcltnc.o HClcltncoui.o -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HClcltncoui.c
HClsrvr : HClsrvr.o HClsrvroui.o
	$(LINK.privCXX) HClsrvr.o HClsrvroui.o -ltmpp -ltm -lnort
	$(OUIUSE) HClsrvroui.c
	$(PROMOTE) HClsrvr
HClengext : HClengext.o ptrhm.o HClengextoui.o
	$(LINK.normCXX) HClengext.o ptrhm.o HClengextoui.o -ltmpp -ltm -lnort
	$(OUIUSE) HClengextoui.c
HClcol.cc : /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc /usr/local/share/huarp/tdrift_col.tmc /usr/local/share/huarp/cpu_usage_col.tmc /usr/local/share/huarp/tmdf_col.tmc /usr/local/share/huarp/freemem_col.tmc AI_col.tmc PTRH_col.tmc temps_col.tmc QCLI_col.tmc
	$(TMC.col) /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc /usr/local/share/huarp/tdrift_col.tmc /usr/local/share/huarp/cpu_usage_col.tmc /usr/local/share/huarp/tmdf_col.tmc /usr/local/share/huarp/freemem_col.tmc AI_col.tmc PTRH_col.tmc temps_col.tmc QCLI_col.tmc
HClcoloui.c : $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/subbus.oui $(OUIDIR)/msg.oui
HClcoloui.o : HClcoloui.c
HClcol.o : HClcol.cc
ptrhm.o : /usr/local/share/huarp/ptrhm.cc
	$(COMPILE.cc) /usr/local/share/huarp/ptrhm.cc
ptrhm_col.o : /usr/local/share/huarp/ptrhm_col.cc
	$(COMPILE.cc) /usr/local/share/huarp/ptrhm_col.cc
HCltbl.tmc : HCl.tbl
-include HCltbl.tmc.dep
TStbl.tmc : TS.tbl
-include TStbl.tmc.dep
HCldisp.cc : /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc HCltbl.tmc rtg.tmc TStbl.tmc
	$(TMC) /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc HCltbl.tmc rtg.tmc TStbl.tmc
HCldispoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HCldispoui.o : HCldispoui.c
HCldisp.o : HCldisp.cc
HCltblnc.tmc : HCl.tbl
-include HCltblnc.tmc.dep
TStblnc.tmc : TS.tbl
-include TStblnc.tmc.dep
HCldispnc.cc : /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc HCltblnc.tmc rtg.tmc TStblnc.tmc
	$(TMC) /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc PTRH_conv.tmc temps_conv.tmc HCltblnc.tmc rtg.tmc TStblnc.tmc
HCldispncoui.c : /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) /usr/local/share/oui/cic.oui $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HCldispncoui.o : HCldispncoui.c
HCldispnc.o : HCldispnc.cc
HClalgoa.tmc : HCl.tma HClsrvr
	$(SERVER) ./HClsrvr
	$(TMCALGO) -V "`./HClsrvr -R`" HCl.tma
HClalgo.cc : /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc HClalgoa.tmc
	$(TMC) /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc HClalgoa.tmc
HClalgooui.c : $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HClalgooui.o : HClalgooui.c
HClalgo.o : HClalgo.cc
doit.dep : HCl.doit
	mkdoit3 -M -o doit  HCl.doit
-include doit.dep
HClcmd.cc : /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/phrtg.cmd /usr/local/share/huarp/qclia.cmd QCLI.cmd waves.cmd
	$(CMDGEN) -d HClcmd.dat /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd /usr/local/share/huarp/phrtg.cmd /usr/local/share/huarp/qclia.cmd QCLI.cmd waves.cmd
HClclt.o : HClcmd.cc
	$(COMPILE.clt) HClcmd.cc
HClcltoui.c : $(OUIDIR)/kbdclt.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/kbdclt.oui $(OUIDIR)/msg.oui
HClcltoui.o : HClcltoui.c
HClcltnc.o : HClcmd.cc
	$(COMPILE.cltnc) HClcmd.cc
HClcltncoui.c : $(OUIDIR)/kbdclt.oui $(OUIDIR)/nctable.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/kbdclt.oui $(OUIDIR)/nctable.oui $(OUIDIR)/msg.oui
HClcltncoui.o : HClcltncoui.c
HClsrvr.o : HClcmd.cc
	$(COMPILE.srvr) HClcmd.cc
HClsrvroui.c : $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/cis.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/msg.oui
HClsrvroui.o : HClsrvroui.c
HClengext.cdf : TMbase.genui HCl.genui QCLI.genui
	$(GENUI2ENG) TMbase.genui HCl.genui QCLI.genui
HClengextcdf.oui : HClengext.cdf
	$(EDF2OUI) HClengext.cdf
HClengextcdf.tmc : HClengext.cdf
	$(EDF2EXT) HClengext.cdf
HClengext.cc : /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc HClengextcdf.tmc
	$(TMC) /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc base.tmc PTRH.tmc T30K75KU.tmc temps.tmc TS_T_t_cal.tmc /usr/local/share/huarp/qcli_types.tmc QCLI.tmc waves.tmc QCLI_conv.tmc HClengextcdf.tmc
HClengextoui.c : HClengextcdf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) HClengextcdf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HClengextoui.o : HClengextoui.c
HClengext.o : HClengext.cc
waves.cmd waves.out waves.tmc waves.m : waves.qcli
	qclicomp -o waves.out -c waves.cmd -d waves.tmc \
	  -v waves.log -m waves.m waves.qcli || \
	  ( rm -f waves.out waves.cmd waves.tmc waves.log waves.m; false )

tidy :
	rm -f $(OBJECT)
clean : tidy
	rm -f $(TARGET)
clean-dist : clean
$(IGNOREFILE) : Makefile
	@for i in $(OBJECT) $(TARGET); do echo "$$i"; done >$(IGNOREFILE)
