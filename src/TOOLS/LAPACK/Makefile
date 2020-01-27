include ../../SLmake.inc

ALLAUX = icopy.o 

SCATGEN = slatm1.o slaran.o slarnd.o

SMATGEN = slatms.o slagge.o slagsy.o slarot.o

DZATGEN = dlatm1.o dlaran.o dlarnd.o

DMATGEN = dlatms.o dlagge.o dlagsy.o dlarot.o

PKG_ALLAUX = $(ALLAUX:.o=.fo)
PKG_SCATGEN = $(SCATGEN:.o=.fo)
PKG_SMATGEN = $(SMATGEN:.o=.fo)
PKG_DZATGEN = $(DZATGEN:.o=.fo)
PKG_DMATGEN = $(DMATGEN:.o=.fo)

single: $(PKG_ALLAUX) $(PKG_SMATGEN) $(PKG_SCATGEN)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) \
                $(PKG_ALLAUX) $(PKG_SMATGEN) $(PKG_SCATGEN)
	$(RANLIB) ../../$(SCALAPACKLIB)

double: single $(PKG_ALLAUX) $(PKG_DMATGEN) $(PKG_DZATGEN)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) \
                $(PKG_ALLAUX) $(PKG_DMATGEN) $(PKG_DZATGEN)
	$(RANLIB) ../../$(SCALAPACKLIB)

clean :
	rm -f *.fo

.SUFFIXES: .fo
.f.fo :
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
