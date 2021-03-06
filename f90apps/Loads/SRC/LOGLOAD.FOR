        SUBROUTINE LOGLOAD(MESSFG,DA_B,MO_B,YR_B, DA_E,MO_E,YR_E,LOAD,
     &                     SELOAD,
     O                     ERRCOD,MESCOD)
C*** REVISION 92.05 5/8/92
C===================================================================
C
C       PROGRAM TO COMPUTE THE MEAN AND THE VARIANCE OF THE SUM
C       OF PREDICTED VALUES BASED ON A LOGNORMAL REGRESSION MODEL:
C
C         Y  =  LN(L) =  X*B + E
C
C		ASSUMES 
C
C       AUTHOR.........TIM COHN
C       DATE...........MAY 8, 1992
C
C===================================================================
C
C       DEFINITIONS OF VARIABLES
C
C         NP        I*4     NUMBER OF PARAMETERS (NP=1 ==> ONLY
C                             A CONSTANT IN THE MODEL)
C         BETA(NP)  R*8     THE COLUMN VECTOR OF ESTIMATED PARAMETERS
C                             B(NP+1) = STND. DEV. RESIDS.
C         NC        I*4     NUMBER VARIABLES IN X_C USED TO CALIBRATE
C                             MODEL
C         NDC       I*4     ROW DIMENSION OF X_C AS DIMENSIONED
C         X_C(*,NP)  R*8     EXPLANATORY VARIABLES FOR CALIBRATION
C                             X_C(1) = 1 ==> A CONSTANT IN MODEL
C         NE        I*4     NUMBER OBS. IN X_E
C         X_E(*,NP)  R*8     REGRESSORS USED TO ESTIMATE
C
C===================================================================

        INCLUDE 'estinclu.inc'

        INTEGER DA_B,MO_B,YR_B,DA_E,MO_E,YR_E,ERRCOD,MESSFG,MESCOD

        ERRCOD = 0

        NE     =  1+NDAYS2(DA_E,MO_E,YR_E)-NDAYS2(DA_B,MO_B,YR_B)
        IOFF   =  NDAYS2(DA_B,MO_B,YR_B)-INDEX
        DO 30 I=1,NE
          I2  =  I+IOFF
          IF(I2 .LE. 0 .OR. I2 .GT. NDV) THEN
            MESCOD = 2
            IF (MESSFG.EQ.1) THEN
              WRITE(*,*) 'INVALID Y_EAR--NO FLOW DATA AVAILABLE'
            END IF
            LOAD   =  0.D0
            SELOAD =  0.D0
            RETURN
          ENDIF
          D_TIME_E(I) =DTIMEC(IY_E(I2),IM_E(I2),ID_E(I2),1200)
          CALL CONVERT(FLOW_E(I2),LQCENT,D_TIME_E(I),DTCENT,XVAR,
     O                 ERRCOD)
          DO 30 J=1,NP
            X_E(I,J)  =  XVAR(IVAR(J))
   30   CONTINUE
C
        IF (ERRCOD.EQ.0) THEN
          IF(IEASY .EQ. 0) THEN
            CALL TACIT_LOAD_VAR(Y_C,NC,YT_C,X_C,NSIZE,NP,
     1                          NE,X_E,N_EX,MVUE,XLOADSUM,XLOADVAR)
          ELSE
            CALL TACIT_LOADS(Y_C,NC,YT_C,X_C,NSIZE,NP,
     1                       NE,X_E,N_EX,MVUE,XLOADSUM,XLOADVAR)
          ENDIF

          LOAD   = XLOADSUM/NE
          SELOAD = SQRT(XLOADVAR)/NE
        END IF

        RETURN
        END
