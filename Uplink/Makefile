LDFLAGS=-Wl,-rpath -Wl,/usr/local/lib -L /usr/local/lib
CPPFLAGS=-I /usr/local/include
CXXFLAGS=-Wall -g
LIBS=-ltmpp -ltm -lnort

SRC = uplink.cc uplinkoui.c
OBJ = ${addsuffix .o, ${basename $(SRC) } }
TGT = uplink

$(TGT) : $(OBJ)
	$(LINK.cc) -o $(TGT) $(OBJ) $(LIBS)
	usemsg $(TGT) uplinkoui.c
uplinkoui.c : uplink.oui
	oui -o uplinkoui.c uplink.oui
.PHONY : clean
clean :
	rm -f *.o uplinkoui.c uplink
