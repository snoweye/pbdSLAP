include ../../SLmake.inc

all: single double

APBTZ = \
    pxerbla.o

IPBTZ = \
    immadd.o       immdda.o       immtadd.o      immddat.o

SPBTZ = \
    svasum.o       sset.o         scshft.o       srshft.o     \
    svvdot.o       smmadd.o       smmcadd.o      smmtadd.o    \
    smmtcadd.o     smmdda.o       smmddac.o      smmddat.o    \
    smmddact.o     stzpad.o       stzpadcpy.o    stzscal.o    \
    sagemv.o       sasymv.o       satrmv.o

SCPBTZ = \
    sasqrtb.o      sascal.o

DPBTZ = \
    dvasum.o       dset.o         dcshft.o       drshft.o     \
    dvvdot.o       dmmadd.o       dmmcadd.o      dmmtadd.o    \
    dmmtcadd.o     dmmdda.o       dmmddac.o      dmmddat.o    \
    dmmddact.o     dtzpad.o       dtzpadcpy.o    dtzscal.o    \
    dagemv.o       dasymv.o       datrmv.o

DZPBTZ = \
    dasqrtb.o      dascal.o

#---------------------------------------------------------------------------

PKG_APBTZ = $(APBTZ:.o=.fo)
PKG_IPBTZ = $(IPBTZ:.o=.fo)
PKG_SPBTZ = $(SPBTZ:.o=.fo)
PKG_SCPBTZ = $(SCPBTZ:.o=.fo)
PKG_DPBTZ = $(DPBTZ:.o=.fo)
PKG_DZPBTZ = $(DZPBTZ:.o=.fo)

single: $(PKG_APBTZ) $(PKG_IPBTZ) $(PKG_SPBTZ) $(PKG_SCPBTZ)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) \
                $(PKG_APBTZ) $(PKG_IPBTZ) $(PKG_SPBTZ) $(PKG_SCPBTZ)
	$(RANLIB) ../../$(SCALAPACKLIB)

double: $(PKG_APBTZ) $(PKG_IPBTZ) $(PKG_DPBTZ) $(PKG_DZPBTZ)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) \
                $(PKG_APBTZ) $(PKG_IPBTZ) $(PKG_DPBTZ) $(PKG_DZPBTZ)
	$(RANLIB) ../../$(SCALAPACKLIB)

#---------------------------------------------------------------------------

clean:
	rm -f *.fo

.SUFFIXES: .fo
.f.fo:
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
