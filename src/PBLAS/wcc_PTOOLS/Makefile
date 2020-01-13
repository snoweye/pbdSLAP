include ../../SLmake.inc

all: single double

#---------------------------------------------------------------------------
#  The following line defines auxiliary routines needed by the PBLAS tools
#---------------------------------------------------------------------------

ALLCTOOLS = \
    wcc_PB_Citypeset.o

#---------------------------------------------------------------------------

ALLTOOLS = $(ALLCTOOLS)

#---------------------------------------------------------------------------
#  The C PBLAS tools
#---------------------------------------------------------------------------

SCTOOLS = wcc_PB_Cstypeset.o

DCTOOLS = wcc_PB_Cdtypeset.o

#---------------------------------------------------------------------------

STOOLS = $(SCTOOLS)
DTOOLS = $(DCTOOLS)

#---------------------------------------------------------------------------

PKG_SPTOOLS = $(ALLTOOLS:.o=.co) $(STOOLS:.o=.co)
PKG_DPTOOLS = $(ALLTOOLS:.o=.co) $(DTOOLS:.o=.co)

single: $(PKG_SPTOOLS)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) $(PKG_SPTOOLS)
	$(RANLIB) ../../$(SCALAPACKLIB)

double: $(PKG_DPTOOLS)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) $(PKG_DPTOOLS)
	$(RANLIB) ../../$(SCALAPACKLIB)

clean:
	rm -f *.fo *.co
  
.SUFFIXES: .fo .co
.f.fo:
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
.c.co:
	$(CC) -o $*.co -c $(CDEFS) $(CCFLAGS) $*.c
