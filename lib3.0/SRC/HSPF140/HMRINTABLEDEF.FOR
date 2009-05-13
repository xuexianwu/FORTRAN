C
C
C
      MODULE HMTABLEDEF
C
C     + + + PURPOSE + + +
C     module containing module table portion of run interpreter 
C
C     + + + HISTORY + + +
C     2009/05/13 JLK - initial implementation
C
C     + + + MODULE VARIABLES + + +
      IMPLICIT NONE
C
      TYPE HMODULE_TABLE
        SEQUENCE
        CHARACTER*12 NAME
        INTEGER      DIM
      END TYPE HMODULE_TABLE
C      
      TYPE HMODULE_TABLE_DEFINITION
        SEQUENCE
        LOGICAL     :: INITIALIZED = .FALSE.
        CHARACTER*8 NAME
        INTEGER     CLUSTER
        TYPE (HMODULE_TABLE), 
     $       ALLOCATABLE, DIMENSION(:)  :: TABLE
      END TYPE HMODULE_TABLE_DEFINITION
C                             
      END MODULE