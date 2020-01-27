include ../SLmake.inc

ALLAUX = pjlaenv.o pilaenvx.o piparmq.o pilaver.o pmpim2.o pmpcol.o

ALLAUX_C = pbchkvect.o getpbbuf.o

SCLAUX = \
   pslabad.o pslaed0.o pslaed1.o pslaed2.o pslaed3.o pslaedz.o \
   pslamch.o pslared1d.o pslasrt.o psstebz.o psstedc.o slapst.o slasrt2.o \
   sstein2.o \
   slar1va.o slarrb2.o slarrd2.o slarre2.o slarre2a.o slarrf2.o \
   slarrv2.o sstegr2.o sstegr2a.o sstegr2b.o

SCLAUX_C = pslaiect.o slamov.o

DZLAUX = \
   pdlabad.o pdlaed0.o pdlaed1.o pdlaed2.o pdlaed3.o pdlaedz.o \
   pdlamch.o pdlared1d.o pdlasrt.o pdstebz.o pdstedc.o dlapst.o dlasrt2.o \
   dstein2.o \
   dlar1va.o dlarrb2.o dlarrd2.o dlarre2.o dlarre2a.o dlarrf2.o \
   dlarrv2.o dstegr2.o dstegr2a.o dstegr2b.o

DZLAUX_C = pdlaiect.o dlamov.o

SLASRC = \
   psdbsv.o  psdbtrf.o psdbtrs.o psdbtrsv.o \
   psdtsv.o  psdttrf.o psdttrs.o psdttrsv.o \
   psgbsv.o  psgbtrf.o psgbtrs.o \
   psgebd2.o psgebrd.o psgecon.o           psgeequ.o psgehd2.o psgehrd.o \
   psgelq2.o psgelqf.o psgels.o  psgeql2.o psgeqlf.o psgeqpf.o psgeqr2.o \
   psgeqrf.o psgerfs.o psgerq2.o psgerqf.o                               \
   psgesv.o  psgesvd.o psgesvx.o psgetf2.o psgetrf.o psgetri.o psgetrs.o \
   psggqrf.o psggrqf.o pslabrd.o \
   pslacon.o pslacp2.o pslacpy.o pslahrd.o pslange.o pslanhs.o pslansy.o \
   pslantr.o pslapiv.o pslapv2.o pslaqge.o pslaqsy.o pslarf.o  pslarfb.o \
   pslarfg.o pslarft.o pslase2.o pslaset.o pslascl.o pslassq.o pslaswp.o \
   pslatra.o pslatrd.o pslatrs.o pslauu2.o pslauum.o psorg2l.o psorg2r.o \
                       psorgl2.o psorglq.o psorgql.o psorgqr.o psorgr2.o \
   psorgrq.o           psorm2l.o psorm2r.o psormbr.o psormhr.o psorml2.o \
   psormlq.o psormql.o psormqr.o psormr2.o psormrq.o psormtr.o pspocon.o \
   pspbsv.o  pspbtrf.o pspbtrs.o pspbtrsv.o \
   psptsv.o  pspttrf.o pspttrs.o pspttrsv.o \
   pspoequ.o psporfs.o psposv.o  psposvx.o pspotf2.o pspotrf.o pspotri.o \
   pspotrs.o psrscl.o  psstein.o pssyev.o  pssyevd.o pssyevx.o \
   pssygs2.o pssygst.o \
   pssygvx.o pssyngst.o pssyntrd.o  pssyttrd.o pssytd2.o pssytrd.o \
   pstrti2.o pstrtri.o pstrtrs.o \
   pslaevswp.o \
   pslarzb.o pslarzt.o pslarz.o pslatrz.o pstzrzf.o psormr3.o psormrz.o \
   pslahqr.o pslaconsb.o pslacp3.o pslawil.o \
   pslasmsub.o pslared2d.o pslamr1d.o slaref.o slamsh.o slasorte.o ssteqr2.o \
   sdbtf2.o  sdbtrf.o  sdttrf.o sdttrsv.o spttrsv.o strmvt.o pssyevr.o \
   bslaapp.o bslaexc.o bstrexc.o pstrord.o pstrsen.o psgebal.o pshseqr.o \
   pslamve.o pslaqr0.o pslaqr1.o pslaqr2.o pslaqr3.o pslaqr4.o pslaqr5.o \
   psrot.o slaqr6.o

DLASRC = \
   pddbsv.o  pddbtrf.o pddbtrs.o pddbtrsv.o \
   pddtsv.o  pddttrf.o pddttrs.o pddttrsv.o \
   pdgbsv.o  pdgbtrf.o pdgbtrs.o \
   pdgebd2.o pdgebrd.o pdgecon.o           pdgeequ.o pdgehd2.o pdgehrd.o \
   pdgelq2.o pdgelqf.o pdgels.o  pdgeql2.o pdgeqlf.o pdgeqpf.o pdgeqr2.o \
   pdgeqrf.o pdgerfs.o pdgerq2.o pdgerqf.o                               \
   pdgesv.o  pdgesvd.o pdgesvx.o pdgetf2.o pdgetrf.o pdgetri.o pdgetrs.o \
   pdggqrf.o pdggrqf.o pdlabrd.o \
   pdlacon.o pdlacp2.o pdlacpy.o pdlahrd.o pdlange.o pdlanhs.o pdlansy.o \
   pdlantr.o pdlapiv.o pdlapv2.o pdlaqge.o pdlaqsy.o pdlarf.o  pdlarfb.o \
   pdlarfg.o pdlarft.o pdlase2.o pdlaset.o pdlascl.o pdlassq.o pdlaswp.o \
   pdlatra.o pdlatrd.o pdlatrs.o pdlauu2.o pdlauum.o pdorg2l.o pdorg2r.o \
                       pdorgl2.o pdorglq.o pdorgql.o pdorgqr.o pdorgr2.o \
   pdorgrq.o           pdorm2l.o pdorm2r.o pdormbr.o pdormhr.o pdorml2.o \
   pdormlq.o pdormql.o pdormqr.o pdormr2.o pdormrq.o pdormtr.o pdpocon.o \
   pdpbsv.o  pdpbtrf.o pdpbtrs.o pdpbtrsv.o \
   pdptsv.o  pdpttrf.o pdpttrs.o pdpttrsv.o \
   pdpoequ.o pdporfs.o pdposv.o  pdposvx.o pdpotf2.o pdpotrf.o pdpotri.o \
   pdpotrs.o pdrscl.o  pdstein.o pdsyev.o  pdsyevd.o pdsyevx.o \
   pdsygs2.o pdsygst.o \
   pdsygvx.o pdsyngst.o pdsyntrd.o pdsyttrd.o pdsytd2.o pdsytrd.o pdtrti2.o \
   pdtrtri.o pdtrtrs.o \
   pdlaevswp.o \
   pdlarzb.o pdlarzt.o pdlarz.o pdlatrz.o pdtzrzf.o pdormr3.o pdormrz.o \
   pdlahqr.o pdlaconsb.o pdlacp3.o pdlawil.o \
   pdlasmsub.o pdlared2d.o pdlamr1d.o dlaref.o dlamsh.o dlasorte.o dsteqr2.o \
   ddbtf2.o  ddbtrf.o  ddttrf.o ddttrsv.o dpttrsv.o dtrmvt.o pdsyevr.o \
   bdlaapp.o bdlaexc.o bdtrexc.o dlaqr6.o pdtrord.o \
   pdtrsen.o pdgebal.o pdhseqr.o pdlamve.o pdlaqr0.o pdlaqr1.o pdlaqr2.o \
   pdlaqr3.o pdlaqr4.o pdlaqr5.o pdrot.o \
   pdtrcon.o

PKG_SLASRC = $(SLASRC:.o=.fo)
PKG_SCLAUX = $(SCLAUX:.o=.fo)
PKG_SCLAUX_C = $(SCLAUX_C:.o=.co)
PKG_DLASRC = $(DLASRC:.o=.fo)
PKG_DZLAUX = $(DZLAUX:.o=.fo)
PKG_DZLAUX_C = $(DZLAUX_C:.o=.co)
PKG_ALLAUX = $(ALLAUX:.o=.fo)
PKG_ALLAUX_C = $(ALLAUX_C:.o=.co)

all: single double

single: $(PKG_SLASRC) $(PKG_SCLAUX) $(PKG_SCLAUX_C) $(PKG_ALLAUX) $(PKG_ALLAUX_C)
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_SLASRC) $(PKG_SCLAUX) \
	        $(PKG_SCLAUX_C) $(PKG_ALLAUX) $(PKG_ALLAUX_C)
	$(RANLIB) ../$(SCALAPACKLIB)

double: single $(PKG_DLASRC) $(PKG_DZLAUX) $(PKG_DZLAUX_C) $(PKG_ALLAUX) $(PKG_ALLAUX_C)
	$(ARCH) $(ARCHFLAGS) ../$(SCALAPACKLIB) $(PKG_DLASRC) $(PKG_DZLAUX) \
	        $(PKG_DZLAUX_C) $(PKG_ALLAUX) $(PKG_ALLAUX_C)
	$(RANLIB) ../$(SCALAPACKLIB)

clean :
	rm -f *.fo *.co

.SUFFIXES: .fo .co
.f.fo : 
	$(FC) -o $*.fo -c $(FCFLAGS) $*.f
.c.co : 
	$(CC) -o $*.co -c $(CDEFS) $(CCFLAGS) $*.c
