include /usr/local/share/huarp/appgen.mk
CPPFLAGS=-I/usr/local/include
CXXFLAGS=-Wall -g
CFLAGS=-Wall -g
LDFLAGS=-L/usr/local/lib -Wl,-rpath -Wl,/usr/local/lib
CXX=g++
LINK.cxx=$(CXX) $(AG_LDFLAGS) $(LDFLAGS)

hcl_serin : hcl_serin.o hcl_serinoui.o
	/bin/rm -f $@; $(LINK.cxx) -o $@ hcl_serin.o hcl_serinoui.o -ltmpp -ltm -lnort
	usemsg hcl_serin hcl_serinoui.c
	/usr/local/sbin/promote hcl_serin
hcl_serinoui.c : hcl_serin.oui
	$(OUI) -o hcl_serinoui.c hcl_serin.oui

.PHONY : all clean
all : hcl_serin
clean :
	rm -f *.o hcl_serinoui.c hcl_serin
