include ../SLmake.inc

ALLAUX = pgemraux.o

SMRSRC = psgemr.o psgemr2.o pstrmr.o pstrmr2.o

DMRSRC = pdgemr.o pdgemr2.o pdtrmr.o pdtrmr2.o \
	pigemr.o pigemr2.o pitrmr.o pitrmr2.o

PKG_ALLAUX = $(ALLAUX:.o=.co)
PKG_SMRSRC = $(SMRSRC:.o=.co)
PKG_DMRSRC = $(DMRSRC:.o=.co)

all: single double

single: $(PKG_SMRSRC) $(PKG_ALLAUX)
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_SMRSRC) $(PKG_ALLAUX)
	$(RANLIB) ../$(SCALAPACKLIB)

double: $(PKG_DMRSRC) $(PKG_ALLAUX)
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_DMRSRC) $(PKG_ALLAUX)
	$(RANLIB) ../$(SCALAPACKLIB)

clean:
	rm -f *.co

.SUFFIXES: .co
.c.co:
	$(CC) -o $*.co -c $(CDEFS) $(CCFLAGS) $*.c
