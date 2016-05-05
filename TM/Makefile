# Invoking: appgen_module TMbase X 
# Makefile Generated Wed May 04 16:35:57 EDT 2016
MNC=HCl
SPECFILE=HCl.spec
PCMFILE=HCl.pcm
SRC=base.tmc freemem.tmc HCl.tbl rtg.tmc HCl.tma HCl.doit HCl.genui
SRC+=TMbase.genui
TOOL=HCl.spec Makefile
SCRIPT=interact
OBJ=HCltbl.tmc HCldisp.cc HCldispoui.c HCldispoui.o HCldisp.o
OBJ+=HCltblnc.tmc HCldispnc.cc HCldispncoui.c HCldispncoui.o
OBJ+=HCldispnc.o HClalgoa.tmc HClalgo.cc HClalgooui.c HClalgooui.o
OBJ+=HClalgo.o doit.dep HClcmd.cc HClcmd.dat HClclt.o HClcltoui.c
OBJ+=HClcltoui.o HClcltnc.o HClcltncoui.c HClcltncoui.o HClsrvr.o
OBJ+=HClsrvroui.c HClsrvroui.o HClcol.cc HCl.pcm tm.dac HClcoloui.c
OBJ+=HClcoloui.o HClcol.o HClengext.cdf HClengextcdf.oui
OBJ+=HClengextcdf.tmc HClengext.cc HClengextoui.c HClengextoui.o
OBJ+=HClengext.o HCltbl.tmc.dep HCltblnc.tmc.dep
TGT=HCldisp HCldispnc HClalgo doit HClclt HClcltnc HClsrvr HClcol
TGT+=HClengext
DISTRIB=HCl.pcm tm.dac
IDISTRIB=Experiment.config VERSION doit
SRCDIST=HCl.tbl HCl.tma base.tmc /usr/local/share/huarp/tdrift.tmc
SRCDIST+=/usr/local/share/huarp/cpu_usage.tmc
SRCDIST+=/usr/local/share/huarp/tmdf.tmc freemem.tmc
SRCDIST+=/usr/local/share/huarp/flttime.tmc
TMCBASE=base.tmc /usr/local/share/huarp/tdrift.tmc
TMCBASE+=/usr/local/share/huarp/cpu_usage.tmc
TMCBASE+=/usr/local/share/huarp/tmdf.tmc freemem.tmc
TMCBASE+=/usr/local/share/huarp/flttime.tmc
CMDBASE=/usr/local/share/huarp/phrtg.cmd
CMDBASE+=/usr/local/share/huarp/root.cmd
CMDBASE+=/usr/local/share/huarp/getcon.cmd
COLBASE=/usr/local/share/huarp/tdrift_col.tmc
COLBASE+=/usr/local/share/huarp/cpu_usage_col.tmc
COLBASE+=/usr/local/share/huarp/tmdf_col.tmc
COLBASE+=/usr/local/share/huarp/freemem_col.tmc
SWSBASE=
QCLIBASE=
SPECDEPBASE=/usr/local/share/huarp/TMbase.agm
SPECDEPBASE+=/usr/local/share/huarp/freemem_def.tmc.in
SPECDEPBASE+=/usr/local/share/huarp/TMbase.genui.in
SPECDEPBASE+=/usr/local/share/huarp/TMbase.tbl.in
AG_CPPFLAGS=
PHTGT=HCltbl.tmc
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
HCldisp : HCldisp.o HCldispoui.o
	$(LINK.normCXX) HCldisp.o HCldispoui.o -ldisp -ltmph -lph -ltmpp -ltm -lnort
	$(OUIUSE) HCldispoui.c
HCldispnc : HCldispnc.o HCldispncoui.o
	$(LINK.normCXX) HCldispnc.o HCldispncoui.o -ldispnc -ltmnc -lncurses -ltmpp -ltm -lnort
	$(OUIUSE) HCldispncoui.c
HClalgo : HClalgo.o HClalgooui.o
	$(LINK.normCXX) HClalgo.o HClalgooui.o -ltmpp -ltm -lnort
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
HClcol : HClcol.o HClcoloui.o
	$(LINK.privCXX) HClcol.o HClcoloui.o -ltmpp -ltm -lnort
	$(OUIUSE) HClcoloui.c
	$(PROMOTE) HClcol
HClengext : HClengext.o HClengextoui.o
	$(LINK.normCXX) HClengext.o HClengextoui.o -ltmpp -ltm -lnort
	$(OUIUSE) HClengextoui.c
HCltbl.tmc : HCl.tbl
-include HCltbl.tmc.dep
HCldisp.cc : base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HCltbl.tmc rtg.tmc
	$(TMC) base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HCltbl.tmc rtg.tmc
HCldispoui.c : $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HCldispoui.o : HCldispoui.c
HCldisp.o : HCldisp.cc
HCltblnc.tmc : HCl.tbl
-include HCltblnc.tmc.dep
HCldispnc.cc : base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HCltblnc.tmc rtg.tmc
	$(TMC) base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HCltblnc.tmc rtg.tmc
HCldispncoui.c : $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/nctable.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HCldispncoui.o : HCldispncoui.c
HCldispnc.o : HCldispnc.cc
HClalgoa.tmc : HCl.tma HClsrvr
	$(SERVER) ./HClsrvr
	$(TMCALGO) -V "`./HClsrvr -R`" HCl.tma
HClalgo.cc : base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HClalgoa.tmc
	$(TMC) base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HClalgoa.tmc
HClalgooui.c : $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/tma.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HClalgooui.o : HClalgooui.c
HClalgo.o : HClalgo.cc
doit.dep : HCl.doit
	mkdoit3 -M -o doit  HCl.doit
-include doit.dep
HClcmd.cc : /usr/local/share/huarp/phrtg.cmd /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd
	$(CMDGEN) -d HClcmd.dat /usr/local/share/huarp/phrtg.cmd /usr/local/share/huarp/root.cmd /usr/local/share/huarp/getcon.cmd
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
HClcol.cc : base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc /usr/local/share/huarp/tdrift_col.tmc /usr/local/share/huarp/cpu_usage_col.tmc /usr/local/share/huarp/tmdf_col.tmc /usr/local/share/huarp/freemem_col.tmc
	$(TMC.col) base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc /usr/local/share/huarp/tdrift_col.tmc /usr/local/share/huarp/cpu_usage_col.tmc /usr/local/share/huarp/tmdf_col.tmc /usr/local/share/huarp/freemem_col.tmc
HClcoloui.c : $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/msg.oui
	$(OUI) $(OUIDIR)/collect.oui $(OUIDIR)/seteuid.oui $(OUIDIR)/msg.oui
HClcoloui.o : HClcoloui.c
HClcol.o : HClcol.cc
HClengext.cdf : HCl.genui TMbase.genui
	$(GENUI2ENG) HCl.genui TMbase.genui
HClengextcdf.oui : HClengext.cdf
	$(EDF2OUI) HClengext.cdf
HClengextcdf.tmc : HClengext.cdf
	$(EDF2EXT) HClengext.cdf
HClengext.cc : base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HClengextcdf.tmc
	$(TMC) base.tmc /usr/local/share/huarp/tdrift.tmc /usr/local/share/huarp/cpu_usage.tmc /usr/local/share/huarp/tmdf.tmc freemem.tmc /usr/local/share/huarp/flttime.tmc HClengextcdf.tmc
HClengextoui.c : HClengextcdf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
	$(OUI) HClengextcdf.oui $(OUIDIR)/dc.oui $(OUIDIR)/msg.oui
HClengextoui.o : HClengextoui.c
HClengext.o : HClengext.cc

tidy :
	rm -f $(OBJECT)
clean : tidy
	rm -f $(TARGET)
clean-dist : clean
$(IGNOREFILE) : Makefile
	@for i in $(OBJECT) $(TARGET); do echo "$$i"; done >$(IGNOREFILE)
