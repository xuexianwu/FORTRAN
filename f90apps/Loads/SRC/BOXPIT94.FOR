        SUBROUTINE BOXPIT(N,X,ICLASS2,TITLE)
C*** REVISION 94.07 7/13/94
C=======================================================================
C
C       SUBROUTINE TO PREPARE BOXPLOTS USING THE IMSL PROGRAM
C       DBOXP
C
C       N.B.  LIMITED TO 100 GROUPS, 2000 POINTS
C
C       DEFINITIONS OF VARIABLES
C
C         N         I*4     NUMBER OF OBSERVATIONS TO PLOT
C         X(N)      R*8     COLUMN VECTOR OF OBSERVATIONS
C         ICLASS(N) I*4     COLUMN VECTOR OF GROUPS
C         TITLE     CHAR    TITLE TO GO OVER BOXPLOTS
C
C
C       AUTHOR........TIM COHN
C       DATE..........MAY 7, 1992
C        MODIFIED.....AUGUST 6, 1992 (TAC & WGB)
C        MODIFIED.....JULY 13, 1994 (TAC)
C
C=======================================================================

        IMPLICIT DOUBLE PRECISION (A-H,O-Z)
        PARAMETER (NPTS=3000,NGRPS=100)

        DIMENSION X(N),ICLASS2(N),NI(NGRPS),XOUT(NPTS),NCUM(NGRPS),
     1            ICLASS(NPTS),KGROUP(NGRPS)

        CHARACTER*(*) TITLE

        NGROUPS       =      0
        DO 80 I=1,N
          DO 85 J=1,NGROUPS
            IF( ICLASS2(I) .EQ. KGROUP(J) ) THEN
              ICLASS(I)     =      J
              GOTO 80
            ENDIF
   85     CONTINUE
          NGROUPS       =      NGROUPS + 1
          KGROUP(NGROUPS)      =      ICLASS2(I)
          ICLASS(I)     =      NGROUPS
   80   CONTINUE

        DO 10 I=1,NGROUPS
          NI(I)   =  0
   10   CONTINUE

        DO 20 I=1,N
          NI(ICLASS(I)) = NI(ICLASS(I)) + 1
   20   CONTINUE

        NCUM(1) = 1
        DO 30 I=2,NGROUPS
          NCUM(I) =  NCUM(I-1)+NI(I-1)
   30   CONTINUE

        DO 40 I=1,N
          XOUT(NCUM(ICLASS(I)))  =  X(I)
          NCUM(ICLASS(I))        =  NCUM(ICLASS(I))+1
   40   CONTINUE

        DO 60 I=1,NGROUPS,6
          IMAX   =      MIN(NGROUPS,I+6)
          INGR   =      IMAX-I
          CALL PAGE(-2,40)
          CALL DBOXP(INGR,NI(I),XOUT(I),TITLE)
   60   CONTINUE

        RETURN
        END
