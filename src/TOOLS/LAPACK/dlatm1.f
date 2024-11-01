      SUBROUTINE DLATM1( MODE, COND, IRSIGN, IDIST, ISEED, D, N, INFO )
*
*  -- LAPACK auxiliary test routine (version 3.1) --
*     Univ. of Tennessee, Univ. of California Berkeley and NAG Ltd..
*     November 2006
*
*     .. Scalar Arguments ..
      INTEGER            IDIST, INFO, IRSIGN, MODE, N
      DOUBLE PRECISION   COND
*     ..
*     .. Array Arguments ..
      INTEGER            ISEED( 4 )
      DOUBLE PRECISION   D( * )
*     ..
*
*  Purpose
*  =======
*
*     DLATM1 computes the entries of D(1..N) as specified by
*     MODE, COND and IRSIGN. IDIST and ISEED determine the generation
*     of random numbers. DLATM1 is called by SLATMR to generate
*     random test matrices for LAPACK programs.
*
*  Arguments
*  =========
*
*  MODE   - INTEGER
*           On entry describes how D is to be computed:
*           MODE = 0 means do not change D.
*           MODE = 1 sets D(1)=1 and D(2:N)=1.0/COND
*           MODE = 2 sets D(1:N-1)=1 and D(N)=1.0/COND
*           MODE = 3 sets D(I)=COND**(-(I-1)/(N-1))
*           MODE = 4 sets D(i)=1 - (i-1)/(N-1)*(1 - 1/COND)
*           MODE = 5 sets D to random numbers in the range
*                    ( 1/COND , 1 ) such that their logarithms
*                    are uniformly distributed.
*           MODE = 6 set D to random numbers from same distribution
*                    as the rest of the matrix.
*           MODE < 0 has the same meaning as ABS(MODE), except that
*              the order of the elements of D is reversed.
*           Thus if MODE is positive, D has entries ranging from
*              1 to 1/COND, if negative, from 1/COND to 1,
*           Not modified.
*
*  COND   - DOUBLE PRECISION
*           On entry, used as described under MODE above.
*           If used, it must be >= 1. Not modified.
*
*  IRSIGN - INTEGER
*           On entry, if MODE neither -6, 0 nor 6, determines sign of
*           entries of D
*           0 => leave entries of D unchanged
*           1 => multiply each entry of D by 1 or -1 with probability .5
*
*  IDIST  - CHARACTER*1
*           On entry, IDIST specifies the type of distribution to be
*           used to generate a random matrix .
*           1 => UNIFORM( 0, 1 )
*           2 => UNIFORM( -1, 1 )
*           3 => NORMAL( 0, 1 )
*           Not modified.
*
*  ISEED  - INTEGER array, dimension ( 4 )
*           On entry ISEED specifies the seed of the random number
*           generator. The random number generator uses a
*           linear congruential sequence limited to small
*           integers, and so should produce machine independent
*           random numbers. The values of ISEED are changed on
*           exit, and can be used in the next call to DLATM1
*           to continue the same random number sequence.
*           Changed on exit.
*
*  D      - DOUBLE PRECISION array, dimension ( MIN( M , N ) )
*           Array to be computed according to MODE, COND and IRSIGN.
*           May be changed on exit if MODE is nonzero.
*
*  N      - INTEGER
*           Number of entries of D. Not modified.
*
*  INFO   - INTEGER
*            0  => normal termination
*           -1  => if MODE not in range -6 to 6
*           -2  => if MODE neither -6, 0 nor 6, and
*                  IRSIGN neither 0 nor 1
*           -3  => if MODE neither -6, 0 nor 6 and COND less than 1
*           -4  => if MODE equals 6 or -6 and IDIST not in range 1 to 3
*           -7  => if N negative
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ONE
      PARAMETER          ( ONE = 1.0D0 )
      DOUBLE PRECISION   HALF
      PARAMETER          ( HALF = 0.5D0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I
      DOUBLE PRECISION   ALPHA, TEMP
*     ..
*     .. External Functions ..
      DOUBLE PRECISION   DLARAN
      EXTERNAL           DLARAN
*     ..
*     .. External Subroutines ..
      EXTERNAL           DLARNV, XERBLA
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS, DBLE, EXP, LOG
*     ..
*     .. Executable Statements ..
*
*     Decode and Test the input parameters. Initialize flags & seed.
*
      INFO = 0
*
*     Quick return if possible
*
      IF( N.EQ.0 )
     $   RETURN
*
*     Set INFO if an error
*
      IF( MODE.LT.-6 .OR. MODE.GT.6 ) THEN
         INFO = -1
      ELSE IF( ( MODE.NE.-6 .AND. MODE.NE.0 .AND. MODE.NE.6 ) .AND.
     $         ( IRSIGN.NE.0 .AND. IRSIGN.NE.1 ) ) THEN
         INFO = -2
      ELSE IF( ( MODE.NE.-6 .AND. MODE.NE.0 .AND. MODE.NE.6 ) .AND.
     $         COND.LT.ONE ) THEN
         INFO = -3
      ELSE IF( ( MODE.EQ.6 .OR. MODE.EQ.-6 ) .AND.
     $         ( IDIST.LT.1 .OR. IDIST.GT.3 ) ) THEN
         INFO = -4
      ELSE IF( N.LT.0 ) THEN
         INFO = -7
      END IF
*
      IF( INFO.NE.0 ) THEN
         CALL XERBLA( 'DLATM1', -INFO )
         RETURN
      END IF
*
*     Compute D according to COND and MODE
*
      IF( MODE.NE.0 ) THEN
*WCC     GO TO ( 10, 30, 50, 70, 90, 110 )ABS( MODE )
         SELECT CASE( ABS( MODE ) )
            CASE ( 1 ) ; GO TO 10
            CASE ( 2 ) ; GO TO 30
            CASE ( 3 ) ; GO TO 50
            CASE ( 4 ) ; GO TO 70
            CASE ( 5 ) ; GO TO 90
            CASE ( 6 ) ; GO TO 110
         END SELECT
*
*        One large D value:
*
   10    CONTINUE
         DO 20 I = 1, N
            D( I ) = ONE / COND
   20    CONTINUE
         D( 1 ) = ONE
         GO TO 120
*
*        One small D value:
*
   30    CONTINUE
         DO 40 I = 1, N
            D( I ) = ONE
   40    CONTINUE
         D( N ) = ONE / COND
         GO TO 120
*
*        Exponentially distributed D values:
*
   50    CONTINUE
         D( 1 ) = ONE
         IF( N.GT.1 ) THEN
            ALPHA = COND**( -ONE / DBLE( N-1 ) )
            DO 60 I = 2, N
               D( I ) = ALPHA**( I-1 )
   60       CONTINUE
         END IF
         GO TO 120
*
*        Arithmetically distributed D values:
*
   70    CONTINUE
         D( 1 ) = ONE
         IF( N.GT.1 ) THEN
            TEMP = ONE / COND
            ALPHA = ( ONE-TEMP ) / DBLE( N-1 )
            DO 80 I = 2, N
               D( I ) = DBLE( N-I )*ALPHA + TEMP
   80       CONTINUE
         END IF
         GO TO 120
*
*        Randomly distributed D values on ( 1/COND , 1):
*
   90    CONTINUE
         ALPHA = LOG( ONE / COND )
         DO 100 I = 1, N
            D( I ) = EXP( ALPHA*DLARAN( ISEED ) )
  100    CONTINUE
         GO TO 120
*
*        Randomly distributed D values from IDIST
*
  110    CONTINUE
         CALL DLARNV( IDIST, ISEED, N, D )
*
  120    CONTINUE
*
*        If MODE neither -6 nor 0 nor 6, and IRSIGN = 1, assign
*        random signs to D
*
         IF( ( MODE.NE.-6 .AND. MODE.NE.0 .AND. MODE.NE.6 ) .AND.
     $       IRSIGN.EQ.1 ) THEN
            DO 130 I = 1, N
               TEMP = DLARAN( ISEED )
               IF( TEMP.GT.HALF )
     $            D( I ) = -D( I )
  130       CONTINUE
         END IF
*
*        Reverse if MODE < 0
*
         IF( MODE.LT.0 ) THEN
            DO 140 I = 1, N / 2
               TEMP = D( I )
               D( I ) = D( N+1-I )
               D( N+1-I ) = TEMP
  140       CONTINUE
         END IF
*
      END IF
*
      RETURN
*
*     End of DLATM1
*
      END
