      REAL    PRZMPF(MXZONE,MXPDT,3), PRZMWF(MXZONE,MXPDT)
C-----PRZM concentrations for MASCOR
CPRH      REAL    ZPESTR(MXZONE,NCMPP2,3)
C-----Chemical flux from PRZM
CPRH      REAL DAFLUX(MXZONE,NCMPP2,MXPDT,3)
C
      COMMON /PRTR42/  PRZMWF  
C
      COMMON /PRTR43/ PRZMPF
CPRH                 ,ZPESTR
C
CPRH      COMMON /PRTR44/ DAFLUX
C

