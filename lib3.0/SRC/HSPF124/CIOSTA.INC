C     from CIOSTA.INC
C       state variables
C
C     + + + PARAMETERS + + +
      INCLUDE 'pmxsta.inc'
      INCLUDE 'pmxosv.inc'
C
      INTEGER MAXOS2
      PARAMETER (MAXOS2=25000)
C
      COMMON/CIOSTA/COLCNT,REPCOD,REPSTP,REPDAT,   RSTDAT,
     $              COLDAT,          STACNT,OPNUM,        TYP,
     $              ADDR,        OSVRST,        OSVREN,        DUM1,
     $              OSV,        STVAL
      INTEGER       COLCNT,REPCOD,REPSTP,REPDAT(5),RSTDAT(5),
     $              COLDAT(5,MAXSTC),STACNT,OPNUM(MAXSTA),TYP(MAXSTA),
     $              ADDR(MAXSTA),OSVRST(MAXSTA),OSVREN(MAXSTA),DUM1,
     $              OSV(MAXOSV),STVAL(MAXSTA,MAXSTC)
C
C     + + + EQUIVALENCES + + +
      EQUIVALENCE  (OSV,OSVR),(OSV,OSVD),(STVAL,STVALR)
      REAL          OSVR(MAXOSV),STVALR(MAXSTA,MAXSTC)
      DOUBLE PRECISION OSVD(MAXOS2)
C
      COMMON/CIOSTC/CRCOD,STNAM,OPNAM,        VARNAM,
     $              SUB
      CHARACTER*2   CRCOD
      CHARACTER*6               OPNAM(MAXSTA),VARNAM(MAXSTA),
     $              SUB(3,MAXSTA)
      CHARACTER*15        STNAM
C
