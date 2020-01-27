include ../../SLmake.inc

all: single double

PBSBLASAUX = pbstran.o pbsmatadd.o pbstrsrt.o pbstrget.o \
             pbstrnv.o pbsvecadd.o pbstrst1.o

PBDBLASAUX = pbdtran.o pbdmatadd.o pbdtrsrt.o pbdtrget.o \
             pbdtrnv.o pbdvecadd.o pbdtrst1.o

PKG_PBSBLASAUX = $(PBSBLASAUX:.o=.fo)
PKG_PBDBLASAUX = $(PBDBLASAUX:.o=.fo)

#---------------------------------------------------------------------------

single: $(PKG_PBSBLASAUX)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) $(PKG_PBSBLASAUX)
	$(RANLIB) ../../$(SCALAPACKLIB)

double: single $(PKG_PBDBLASAUX)
	$(ARCH) $(ARCHFLAGS) ../../$(SCALAPACKLIB) $(PKG_PBDBLASAUX)
	$(RANLIB) ../../$(SCALAPACKLIB)

#---------------------------------------------------------------------------

clean :
	rm -f *.fo

.SUFFIXES: .fo
.f.fo:
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
