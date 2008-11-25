!------------------------------------------------------------------------------
!    This code is part of the MondoSCF suite of programs for linear scaling
!    electronic structure theory and ab initio molecular dynamics.
!
!    Copyright (2004). The Regents of the University of California. This
!    material was produced under U.S. Government contract W-7405-ENG-36
!    for Los Alamos National Laboratory, which is operated by the University
!    of California for the U.S. Department of Energy. The U.S. Government has
!    rights to use, reproduce, and distribute this software.  NEITHER THE
!    GOVERNMENT NOR THE UNIVERSITY MAKES ANY WARRANTY, EXPRESS OR IMPLIED,
!    OR ASSUMES ANY LIABILITY FOR THE USE OF THIS SOFTWARE.
!
!    This program is free software; you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by the
!    Free Software Foundation; either version 2 of the License, or (at your
!    option) any later version. Accordingly, this program is distributed in
!    the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
!    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
!    PURPOSE. See the GNU General Public License at www.gnu.org for details.
!
!    While you may do as you like with this software, the GNU license requires
!    that you clearly mark derivative software.  In addition, you are encouraged
!    to return derivative works to the MondoSCF group for review, and possible
!    disemination in future releases.
!------------------------------------------------------------------------------

PROGRAM RHEqs
  USE DerivedTypes
  USE GlobalScalars
  USE GlobalCharacters
  USE InOut
  USE PrettyPrint
  USE MemMan
  USE Parse
  USE Macros
  USE SetXYZ
  USE LinAlg
  USE DenMatMethods,ONLY:MDiag_DSYEVX,MDiag_DSYEVD
  USE MondoLogger
#ifdef NAG
  USE F90_UNIX_ENV
#endif

  IMPLICIT NONE

  TYPE(BCSR)                     :: sP,sF,FT,sX,sTmp1,sTmp2
  TYPE(DBL_RNK2)                 :: X,F,MO,P
  TYPE(DBL_VECT)                 :: EigenV
  TYPE(ARGMT)                    :: Args
  REAL(DOUBLE)                   :: CJK,HOMO,LUMO,dt
  REAL(DOUBLE)                   :: Mu,Entrop,Ek,Z,A1,A2,H1,H3,H4,Fk,Sigma,Dum
  INTEGER                        :: I,J,K,LgN,NRow,NCol,NSMat
  CHARACTER(LEN=DEFAULT_CHR_LEN) :: Mssg,FMatrix,PMatrix,XFile,smearing
  CHARACTER(LEN=5),PARAMETER     :: Prog='RHEqs'
  LOGICAL                        :: Present,DensityArchive
  EXTERNAL :: DGEMM_NT
  !--------------------------------------------------------------------
  !
  !
  CALL StartUp(Args,Prog,Serial_O=.TRUE.)
  !--------------------------------------------------------------------
  ! Initialize and parse some variables.
  !
  CALL OpenASCII(InpFile,Inp)
  Smearing='NoSmearing'
  Sigma=0.002D0
  IF(OptKeyQ(Inp,'Smearing','MP')) Smearing='Methfessel-Paxton'
  IF(OptDblQ(Inp,'SmearingValue',Dum)) Sigma=Dum
  CLOSE(Inp)
  !--------------------------------------------------------------------
  !
  !
  CALL New(sF)
  FMatrix=TrixFile('F_DIIS',Args,0)
  INQUIRE(FILE=FMatrix,EXIST=Present)
  IF(Present)THEN
    CALL Get(sF,FMatrix)
  ELSE
    CALL Get(sF,TrixFile('OrthoF',Args,0))    ! the orthogonalized Fock matrix
  ENDIF

  NSMat=sF%NSMat
  IF(NSMat.GT.1.AND.Smearing.NE.'NoSmearing')CALL Halt('Smearing with unrestricted are not supported!')
  !
  SELECT CASE(NSMat)
  CASE(1);NRow=  NBasF;NCol=  NBasF
  CASE(2);NRow=  NBasF;NCol=2*NBasF
  CASE(4);NRow=2*NBasF;NCol=2*NBasF
  CASE DEFAULT;CALL Halt(' RHeqs: sF%NSMat doesn''t have an expected value! ')
  END SELECT

!!$  ! Some symmetry checks.
!!$  CALL New(FT)
!!$
!!$  CALL Xpose(sF, FT)
!!$  FT%MTrix%D = -FT%MTrix%D
!!$  CALL Add(sF, FT, sTmp1)
!!$  CALL MondoLog(DEBUG_MINIMUM, "RHeqs", "FNorm(F-FT) = "//TRIM(DblToChar(FNorm(sTmp1))))
!!$  CALL Delete(FT)

  CALL New(F,(/NRow,NCol/))
  CALL SetEq(F,sF)
  CALL Delete(sF)

  !write(*,*) 'RHeqs: NSMat',NSMat
  !write(*,*) 'RHeqs: NAlph',NAlph
  !write(*,*) 'RHeqs: NBeta',NBeta

  CALL New(EigenV,NCol)
  CALL SetEq(EigenV,Zero)

  SELECT CASE(NSMat)
  CASE(1)
    ! We just have one matrix.
    IF(Smearing.EQ.'NoSmearing')THEN
      CALL MDiag_DSYEVX(F,NBasF,MIN(NBasF,Nel/2+1),EigenV,0)
    ELSE
      CALL MDiag_DSYEVD(F,NBasF,EigenV,0)
    ENDIF
    !
    HOMO=EigenV%D(NEl/2)
    LUMO=EigenV%D(MIN(NBasF,Nel/2+1))
  CASE(2)
    ! We have a block diagonal matrix, we diag each blocks separately.
    IF(Smearing.EQ.'NoSmearing')THEN
      CALL MDiag_DSYEVX(F,NBasF,MIN(NBasF,NAlph+1),EigenV,0)
      CALL MDiag_DSYEVX(F,NBasF,MIN(NBasF,NBeta+1),EigenV,NBasF)
    ELSE
      CALL MDiag_DSYEVD(F,NBasF,EigenV,0)
      CALL MDiag_DSYEVD(F,NBasF,EigenV,NBasF)
    ENDIF
    !
    IF(EigenV%D(NAlph)-EigenV%D(NAlph+1).LT.EigenV%D(NBasF+NBeta)-EigenV%D(NBasF+NBeta+1)) THEN
      HOMO=EigenV%D(NAlph  )
      LUMO=EigenV%D(MIN(NBasF,NAlph+1))
    ELSE
      HOMO=EigenV%D(NBasF+NBeta  )
      LUMO=EigenV%D(NBasF+MIN(NBasF,NBeta+1))
    ENDIF
  CASE(4)
    ! We just have one matrix.
    IF(Smearing.EQ.'NoSmearing')THEN
      CALL MDiag_DSYEVX(F,2*NBasF,MIN(NBasF,Nel+1),EigenV,0)
    ELSE
      CALL MDiag_DSYEVD(F,2*NBasF,EigenV,0)
    ENDIF
    !
    HOMO=EigenV%D(NEl)
    LUMO=EigenV%D(MIN(NBasF,Nel+1))
  CASE DEFAULT;CALL Halt(' RHeqs: NSMat doesn''t have an expected value! ')
  END SELECT
  !
  Mu=(HOMO+LUMO)*0.5D0

  !IF(PrintFlags%Key>=DEBUG_MEDIUM)THEN
    !Mssg=ProcessName(Prog)//'HOMO = '//TRIM(DblToMedmChar(HOMO)) &
         !//', LUMO = '//TRIM(DblToMedmChar(LUMO))
    !CALL OpenASCII(OutFile,Out)
    !CALL PrintProtectL(Out)
    !WRITE(Out,*)TRIM(Mssg)
    !CALL PrintProtectR(Out)
    !CLOSE(Out)
  !ENDIF
  CALL MondoLog(DEBUG_MINIMUM, "RHeqs", ProcessName(Prog)//'HOMO = '//TRIM(DblToMedmChar(HOMO)) &
    //', LUMO = '//TRIM(DblToMedmChar(LUMO)))
  CALL Put(HOMO-LUMO,'HomoLumoGap')
  !
  !--------------------------------------------------------------
  ! Make a new closed shell, orthogonal density matrix
  !
  CALL New(P,(/NRow,NCol/))
  CALL DBL_VECT_EQ_DBL_SCLR(NRow*NCol,P%D(1,1),Zero)
  !
  SELECT CASE(Smearing)
  CASE('Methfessel-Paxton')
    Entrop=0D0
    DO K=1,NBasF
      ! PRB 40, 3616, 1989.
      ! Second order smearing N=2.
      Ek=EigenV%D(K)
      Z=(Ek-Mu)/Sigma
      A1=-1D0/( 4D0*SqrtPi)
      A2= 1D0/(32D0*SqrtPi)
      H1=2D0*Z
      H3=Z*(8D0*Z**2-12D0)
      H4=Z**2*(16D0*Z**2-48D0)+12D0
      ! Fractional occupation.
      Fk=0.5D0*(1D0-ERF(Z))+EXP(-Z**2)*(A1*H1+A2*H3)
      ! Entropic correction to the energy (Comp. Mat. Sci. 6, 15, 1996).
      Entrop=Entrop+Sigma*0.5D0*A2*H4*EXP(-Z**2)
      !write(*,*) Fk,Entrop
      DO J=1,NBasF
        CJK=F%D(J,K)*Fk
        DO I=1,NBasF
          P%D(I,J)=P%D(I,J)+F%D(I,K)*CJK
        ENDDO
      ENDDO
    ENDDO
    !IF(PrintFlags%Key>=DEBUG_MEDIUM)THEN
    !  Mssg=ProcessName(Prog)//'Sigma = '//TRIM(DblToShrtChar(Sigma)) &
    !                       //', Entropic correction per atom = ' &
    !                       //TRIM(DblToShrtChar(Entrop/DBLE(NAtoms)))
    !  CALL OpenASCII(OutFile,Out)
    !  CALL PrintProtectL(Out)
    !  WRITE(Out,*)TRIM(Mssg)
    !  CALL PrintProtectR(Out)
    !  CLOSE(Out)
    !ENDIF
    CALL MondoLog(DEBUG_MEDIUM, "RHeqs", ProcessName(Prog)//'Sigma = '//TRIM(DblToShrtChar(Sigma)) &
      //', Entropic correction per atom = ' &
      //TRIM(DblToShrtChar(Entrop/DBLE(NAtoms))))
  CASE('NoSmearing')
    !
    SELECT CASE(NSMat)
    CASE(1)
      ! We have one density matrix to build.
      CALL DGEMM_NT(NBasF,Nel/2,NBasF,0D0,F%D(1,1),F%D(1,1),P%D(1,1))
      !CALL DGEMM('N','T',NBasF,NBasF,Nel/2,1D0,F%D(1,1), &
      !           NBasF,F%D(1,1),NBasF,0D0,P%D(1,1),NBasF)
    CASE(2)
      ! We have two density matrices to build.
      CALL DGEMM_NT(NBasF,NAlph,NBasF,0D0,F%D(1,      1),F%D(1,      1),P%D(1,      1))
      CALL DGEMM_NT(NBasF,NBeta,NBasF,0D0,F%D(1,NBasF+1),F%D(1,NBasF+1),P%D(1,NBasF+1))
      !CALL DGEMM('N','T',NBasF,NBasF ,NAlph,1D0,F%D(1,      1), &
      !           NBasF,F%D(1,      1),NBasF,0D0,P%D(1,      1),NBasF)
      !CALL DGEMM('N','T',NBasF,NBasF ,NBeta,1D0,F%D(1,NBasF+1), &
      !           NBasF,F%D(1,NBasF+1),NBasF,0D0,P%D(1,NBasF+1),NBasF)
    CASE(4)
      ! We have one density matrix to build.
      CALL DGEMM_NT(2*NBasF,Nel,2*NBasF,0D0,F%D(1,1),F%D(1,1),P%D(1,1))
      !CALL DGEMM('N','T',2*NBasF,2*NBasF,Nel,1D0,F%D(1,1), &
      !           2*NBasF,F%D(1,1),2*NBasF,0D0,P%D(1,1),2*NBasF)
    CASE DEFAULT;CALL Halt(' RHeqs: NSMat doesn''t have an expected value! ')
    END SELECT
    !
  CASE DEFAULT;CALL Halt('RHEqs: Doesn''t regonize this Smearing <'//TRIM(Smearing)//'>')
  END SELECT
  !
  CALL Delete(EigenV)

  CALL SetEq(sX,P,nsmat_o=nsmat)          !  sX=P
  CALL New(sP,nsmat_o=nsmat)
  CALL Filter(sP,sX)        !  sP=Filter[sX]
  CALL Put(sP,TrixFile('OrthoD',Args,1))
  CALL PChkSum(sP,'OrthoP['//TRIM(NxtCycl)//']',Prog)
  CALL PPrint(sP,'OrthoP['//TRIM(NxtCycl)//']')

  CALL Plot(sP,'OrthoP['//TRIM(NxtCycl)//']')
  ! Transform to non-orthogonal rep
  XFile=TrixFile('X',Args)
  IF(MyID.EQ.0) INQUIRE(FILE=XFile,EXIST=Present)
#ifdef PARALLEL
  CALL BCast(Present)
#endif

  IF(Present)THEN
    CALL Get(sX,XFile)                  ! X =S^{-1/2}
    CALL Multiply(sX,sP,sTmp1)          ! T1=S^{-1/2}.P_Orthog
    CALL Multiply(sTmp1,sX,sP)          ! T1=S^{-1/2}.P_Orthog.S^{-1/2}
  ELSE
    CALL Get(sX,TrixFile('Z',Args))     ! X=Z=L^{-1}
    CALL Multiply(sX,sP,sTmp1)          ! T1=Z.P_Orthog
    CALL Get(sX,TrixFile('ZT',Args))    ! X =Z^t=L^{-t}
    CALL Multiply(sTmp1,sX,sP)          ! F=Z.P_Orthog.Z^t
  ENDIF
  CALL Filter(sTmp1,sP)                 ! T1 =P_AO=Filter[Z.P_Orthog.Z^t]

  ! Archive the AO-DM
  CALL Get(DensityArchive,'ArchiveDensity')
  IF(DensityArchive) THEN
    CALL Put(sTmp1,'CurrentDM',CheckPoint_O=.TRUE.)
  ENDIF

  CALL Put(sTmp1,TrixFile('D',Args,1))
  CALL PChkSum(sTmp1,'P['//TRIM(NxtCycl)//']',Prog)
  CALL PPrint(sTmp1,'P['//TRIM(NxtCycl)//']')
  CALL Plot(sTmp1,'P['//TRIM(NxtCycl)//']')

  CALL Delete(sX)
  CALL Delete(sP)
  CALL Delete(sTmp1)
  CALL ShutDown(Prog)
END PROGRAM  RHEqs
