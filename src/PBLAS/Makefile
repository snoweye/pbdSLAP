include ../SLmake.inc

all: single double

APPBLAS = pilaenv.o

#---------------------------------------------------------------------------
#  Comment out the next 5 definitions if you already have the Level 1 PBLAS.
#---------------------------------------------------------------------------

PIBLAS1 = picopy_.o

PSBLAS1 = psswap_.o psscal_.o  pscopy_.o  psaxpy_.o psdot_.o  psnrm2_.o \
          psasum_.o psamax_.o

PDBLAS1 = pdswap_.o pdscal_.o  pdcopy_.o  pdaxpy_.o pddot_.o  pdnrm2_.o \
          pdasum_.o pdamax_.o

#---------------------------------------------------------------------------
#  Comment out the next 4 definitions if you already have the Level 2 PBLAS.
#---------------------------------------------------------------------------

PSBLAS2 = psgemv_.o  psger_.o   pssymv_.o  pssyr_.o   pssyr2_.o  pstrmv_.o \
          pstrsv_.o  psagemv_.o psasymv_.o psatrmv_.o

PDBLAS2 = pdgemv_.o  pdger_.o   pdsymv_.o  pdsyr_.o   pdsyr2_.o  pdtrmv_.o \
          pdtrsv_.o  pdagemv_.o pdasymv_.o pdatrmv_.o

#---------------------------------------------------------------------------
#  Comment out the next 4 definitions if you already have the Level 3 PBLAS.
#---------------------------------------------------------------------------

PSBLAS3 = psgeadd_.o psgemm_.o pssymm_.o  pssyr2k_.o pssyrk_.o  pstradd_.o \
          pstran_.o  pstrmm_.o pstrsm_.o

PDBLAS3 = pdgeadd_.o pdgemm_.o pdsymm_.o  pdsyr2k_.o pdsyrk_.o  pdtradd_.o \
          pdtran_.o  pdtrmm_.o pdtrsm_.o

#---------------------------------------------------------------------------

PKG_PIBLAS = $(PIBLAS1:.o=.co) $(APPBLAS:.o=.fo)
PKG_PSBLAS = $(PSBLAS1:.o=.co) $(PSBLAS2:.o=.co) $(PSBLAS3:.o=.co) $(APPBLAS:.o=.fo)
PKG_PDBLAS = $(PDBLAS1:.o=.co) $(PDBLAS2:.o=.co) $(PDBLAS3:.o=.co) $(APPBLAS:.o=.fo)

integer: $(PKG_PIBLAS)
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_PIBLAS)
	$(RANLIB) ../$(SCALAPACKLIB)

single: integer $(PKG_PSBLAS)
	( cd PBBLAS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) single )
	( cd PTZBLAS; CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) single )
	( cd PTOOLS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) single )
	( cd wcc_PTOOLS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) single )
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_PSBLAS)
	$(RANLIB) ../$(SCALAPACKLIB)

double: integer $(PKG_PDBLAS)
	( cd PBBLAS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) double )
	( cd PTZBLAS; CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) double )
	( cd PTOOLS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) double )
	( cd wcc_PTOOLS;  CDEFS='$(CDEFS)' PKG_CPPFLAGS='$(PKG_CPPFLAGS)' PKG_CFLAGS='$(PKG_CFLAGS)' MkInclude='$(MkInclude)' $(MAKE) double )
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_PDBLAS)
	$(RANLIB) ../$(SCALAPACKLIB)

clean :
	rm -f *.co *.fo
	( cd PBBLAS;  $(MAKE) clean )
	( cd PTZBLAS; $(MAKE) clean )
	( cd PTOOLS;  $(MAKE) clean )
	( cd wcc_PTOOLS;  $(MAKE) clean )

.SUFFIXES: .fo .co
.f.fo :
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
.c.co :
	$(CC) -o $*.co -c $(CDEFS) $(CCFLAGS) $*.c
#
# To compile  without  input  argument checking replace previous line by
# .c.o : ; $(CC) -c $(CCFLAGS)  -DNO_ARGCHK $*.c
#
# Note that when the PBLAS routines have been compiled without input ar-
# gument checking, it is impossible to test PBLAS error exits. Trying to
# test PBLAS error exits will then cause the tester executable to hang.
#
