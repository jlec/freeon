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
MODULE PBCFarField
  USE Derivedtypes
  USE GlobalScalars
  USE GlobalObjects
  USE ProcessControl
  USE Indexing
  USE Parse
  USE InOut
  USE Macros
  USE Thresholding
  USE BoundingBox
  USE McMurchie
  USE AtomPairs
  USE MondoPoles
  USE PoleTree
  USE SpecFun
  USE Globals
  USE PFFTen
  USE MondoLogger

  IMPLICIT NONE

  INTEGER                             :: MaxELL
  REAL(DOUBLE)                        :: E_PFF,E_DP
  REAL(DOUBLE)                        :: PDist,BDist,RDist
  REAL(DOUBLE),DIMENSION(3)           :: BOXDist
  !
  TYPE(DBL_VECT)                      :: TensorC,TensorS
  TYPE(DBL_VECT)                      :: TenRhoC,TenRhoS
  TYPE(DBL_VECT)                      :: RhoC,RhoS
  TYPE(DBL_VECT)                      :: PFFBraC,PFFBraS
  TYPE(DBL_VECT)                      :: PFFKetC,PFFKetS
  TYPE(DBL_RNK3)                      :: dTensorC,dTensorS
  TYPE(DBL_RNK3)                      :: dTenRhoC,dTenRhoS
CONTAINS
  !====================================================================================
  !   Setup the PBCFarField Matrix.
  !====================================================================================
  SUBROUTINE PBCFarFieldSetUp(Q,GMLoc)
    TYPE(PoleNode)                  :: Q
    TYPE(CRDS)                      :: GMLoc
    INTEGER                         :: I,J,K,NC,L,LM,LP
    REAL(DOUBLE)                    :: Layers,OL,NL,FAC,Px,Py,Pz
    REAL(DOUBLE),DIMENSION(3)       :: PQ
    !
    IF(GMLoc%PBC%Dimen==0) RETURN
    CALL Get(MaxEll,'MaxEll')
    CALL New(TensorC,LSP(2*MaxEll),0)
    CALL New(TensorS,LSP(2*MaxEll),0)
    CALL New(dTensorC,(/LSP(2*MaxEll),3,3/),(/0,1,1/))
    CALL New(dTensorS,(/LSP(2*MaxEll),3,3/),(/0,1,1/))
    CALL Get(TensorC,'PFFTensorC')
    CALL Get(TensorS,'PFFTensorS')
    CALL Get(dTensorC,'dPFFTensorC')
    CALL Get(dTensorS,'dPFFTensorS')
    !     Initialize Arrays
    CALL New(TenRhoC,LSP(MaxEll),0)
    CALL New(TenRhoS,LSP(MaxEll),0)
    CALL New(dTenRhoC,(/LSP(2*MaxEll),3,3/),(/0,1,1/))
    CALL New(dTenRhoS,(/LSP(2*MaxEll),3,3/),(/0,1,1/))
    CALL New(PFFBraC,LSP(MaxEll),0)
    CALL New(PFFBraS,LSP(MaxEll),0)
    CALL New(PFFKetC,LSP(MaxEll),0)
    CALL New(PFFKetS,LSP(MaxELL),0)
    CALL New(RhoC,LSP(FFEll),0)
    CALL New(RhoS,LSP(FFEll),0)
    !     Calculate the Box Moments and the BDist
    CALL RhoToSP(GMLoc)
    !     Contract TenRho
    TenRhoC%D=Zero
    TenRhoS%D=Zero
    CALL CTraX77(MaxEll,MaxEll,TenRhoC%D,TenRhoS%D,TensorC%D,TensorS%D,RhoC%D,RhoS%D)
    !     Contract dTenRho
    dTenRhoC%D=Zero
    dTenRhoS%D=Zero
    DO I=1,3
      DO J=1,3
        IF(GMLoc%PBC%AutoW%I(I)==1 .AND. GMLoc%PBC%AutoW%I(J)==1) THEN
          CALL CTraX77(MaxEll,MaxEll,dTenRhoC%D(:,I,J),dTenRhoS%D(:,I,J), &
               dTensorC%D(:,I,J),dTensorS%D(:,I,J),RhoC%D,RhoS%D)
        ENDIF
      ENDDO
    ENDDO
    !     PACDist (From PoleRoot)
    Px=Half*(Q%Box%BndBox(1,2)-Q%Box%BndBox(1,1))
    Py=Half*(Q%Box%BndBox(2,2)-Q%Box%BndBox(2,1))
    Pz=Half*(Q%Box%BndBox(3,2)-Q%Box%BndBox(3,1))
    PDist = SQRT(Px*Px+Py*Py+Pz*Pz)
    !     If Not Over Riden Calculate MaxEll
    MaxEll=CalMaxEll(GMLoc)
    !     Calculate PFF  energy
    E_PFF = Zero
    DO LM = 0,LSP(MaxELL)
      E_PFF = E_PFF + Two*RhoC%D(LM)*TenRhoC%D(LM)+Two*RhoS%D(LM)*TenRhoS%D(LM)
    ENDDO
    !     Calculate Dipole energy
    IF(GMLoc%PBC%Dimen == 1) THEN
      E_DP = 0.0D0
    ELSEIF(GMLoc%PBC%Dimen == 2) THEN
      IF(GMLoc%PBC%AutoW%I(1)==0 ) E_DP = Two*GMLoc%PBC%DipoleFAC*RhoPoles%DPole%D(1)**2
      IF(GMLoc%PBC%AutoW%I(2)==0 ) E_DP = Two*GMLoc%PBC%DipoleFAC*RhoPoles%DPole%D(2)**2
      IF(GMLoc%PBC%AutoW%I(3)==0 ) E_DP = Two*GMLoc%PBC%DipoleFAC*RhoPoles%DPole%D(3)**2
    ELSEIF(GMLoc%PBC%Dimen == 3) THEN
      E_DP = Two*GMLoc%PBC%DipoleFAC*(RhoPoles%DPole%D(1)**2+RhoPoles%DPole%D(2)**2+RhoPoles%DPole%D(3)**2)
    ELSE
      CALL Halt('PBCFarField: Unknown dimension <'//IntToChar(GMLoc%PBC%Dimen)//'>')
    ENDIF
    !
  END SUBROUTINE PBCFarFieldSetUp
  !====================================================================================
  !   Calculate the FarField Component of the J matrix
  !====================================================================================
  FUNCTION CTraxFF(Prim,HGBra,GMLoc) RESULT(CTFF)
    TYPE(PrimPair)                   :: Prim
    INTEGER                          :: LM
    REAL(DOUBLE)                     :: PiZ,CTFF
    REAL(DOUBLE), DIMENSION(3)       :: PQ,HGDipole
    REAL(DOUBLE), DIMENSION(1:)      :: HGBra
    TYPE(CRDS)                       :: GMLoc
    !
    CTFF=Zero
    !     Transform <Bra| coefficients from HG to SP
    PiZ=(Pi/Prim%Zeta)**(ThreeHalves)
    CALL HGToSP_Gen(Prim%Ell,PiZ,HGBra,PFFKetC%D,PFFKetS%D)
    PQ = Prim%P-GMLoc%PBC%CellCenter%D
    !     Contract
    IF(NoTranslate(PQ)) THEN
      DO LM = 0,LSP(Prim%Ell)
        CTFF = CTFF + PFFKetC%D(LM)*TenRhoC%D(LM)+PFFKetS%D(LM)*TenRhoS%D(LM)
      ENDDO
    ELSE
      PFFBraC%D=Zero
      PFFBraS%D=Zero
      CALL Regular(MaxELL,PQ(1),PQ(2),PQ(3))
      CALL XLate77(MaxEll,Prim%Ell,PFFBraC%D,PFFBraS%D,Cpq,Spq,PFFKetC%D,PFFKetS%D)
      DO LM=0,LSP(MaxEll)
        CTFF = CTFF + PFFBraC%D(LM)*TenRhoC%D(LM)+PFFBraS%D(LM)*TenRhoS%D(LM)
      ENDDO
    ENDIF
    !     Include the Dipole correction to FarFC and FarFS
    PQ=Prim%P-GMLoc%PBC%CellCenter%D
    IF(GMLoc%PBC%Dimen==1) THEN
      RETURN
    ELSEIF(GMLoc%PBC%Dimen==2) THEN
      HGDipole = CalculateDiPole(Prim%Ell,Prim%Zeta,PQ(1),PQ(2),PQ(3),HGBra(1:))
      IF(GMLoc%PBC%AutoW%I(1)==0) CTFF  = CTFF + GMLoc%PBC%DipoleFAC*HGDipole(1)*RhoPoles%DPole%D(1)
      IF(GMLoc%PBC%AutoW%I(2)==0) CTFF  = CTFF + GMLoc%PBC%DipoleFAC*HGDipole(2)*RhoPoles%DPole%D(2)
      IF(GMLoc%PBC%AutoW%I(3)==0) CTFF  = CTFF + GMLoc%PBC%DipoleFAC*HGDipole(3)*RhoPoles%DPole%D(3)
      RETURN
    ELSEIF(GMLoc%PBC%Dimen==3) THEN
      HGDipole = CalculateDiPole(Prim%Ell,Prim%Zeta,PQ(1),PQ(2),PQ(3),HGBra(1:))
      CTFF  = CTFF + GMLoc%PBC%DipoleFAC*(HGDipole(1)*RhoPoles%DPole%D(1)         &
           + HGDipole(2)*RhoPoles%DPole%D(2)         &
           + HGDipole(3)*RhoPoles%DPole%D(3) )
      RETURN
    ENDIF
    !
  END FUNCTION CTraxFF
  !----------------------------------------------------------------------------------------------
  !   Print out Periodic Info
  !----------------------------------------------------------------------------------------------
  SUBROUTINE Print_Periodic(GMLoc,Prog,Unit_O)
    INTEGER,OPTIONAL                :: Unit_O
    INTEGER                         :: Unit
    TYPE(CRDS)                      :: GMLoc
    CHARACTER(LEN=*)                :: Prog
    CHARACTER(LEN=DEFAULT_CHR_LEN)  :: Mssg
    REAL(DOUBLE)                    :: Layers
    !
#ifdef PARALLEL
    IF(MyID==ROOT) THEN
#endif
      Layers = SQRT(CS_IN%CellCarts%D(1,1)**2+CS_IN%CellCarts%D(2,1)**2+CS_IN%CellCarts%D(3,1)**2)/MaxBoxDim(GMLoc)
      IF(GMLoc%PBC%Dimen > 0) THEN
        Unit=OpenPU(Unit_O=Unit_O)
        IF(PrintFlags%Key > DEBUG_MINIMUM) THEN
          Mssg=ProcessName(Prog,TRIM(IntToChar(GMLoc%PBC%Dimen))//'-D periodics')   &
               //'MxL = '//TRIM(IntToChar(MaxEll))                                  &
               //', PAC Cells = '//TRIM(IntToChar(CS_OUT%NCells))                   &
               //', MAC Cells = '//TRIM(IntToChar(CS_IN%NCells))
          WRITE(Unit,*)TRIM(Mssg)
          Mssg=ProcessName(Prog,'FF Energy')//'<FF> = '//TRIM(DblToChar(E_PFF))
          WRITE(Unit,*)TRIM(Mssg)
        ENDIF
        CALL ClosePU(Unit)
      ENDIF
#ifdef PARALLEL
    ENDIF
#endif
    !
100 FORMAT('========================================Periodic Information======================================')
101 FORMAT(' MaxEll             = ',I3,'     Dimension = ',I2)
102 FORMAT(' Dipole Moment      = (',F12.6,',',F12.6,',',F12.6,')')
103 FORMAT(' PAC Distance       = ',F6.2,' BOX Distance = ',F6.2,' Cell Distance = ',F6.2)
108 FORMAT(' No. of Layers      = ',F6.2)
104 FORMAT(' Outer No. of Cells = ',I4)
110 FORMAT(' Inner No. of Cells = ',I4)
105 FORMAT(' Correction to the Energy:')
106 FORMAT('   PFF = ',E14.6,'  Dipole = ',E14.6)
107 FORMAT('=========================================END======================================================')
    !
  END SUBROUTINE Print_Periodic
  !========================================================================================
  ! Calculate the SP Moments of Rho_Loc
  !========================================================================================
  SUBROUTINE RhoToSP(GMLoc,zq_low_o,zq_hig_o)
    INTEGER,OPTIONAL                :: zq_low_o,zq_hig_o
    INTEGER                         :: zq_low,zq_hig
    INTEGER                         :: LP,LQ,LPQ,LenP,LenQ,LenPQ,LKet,I
    INTEGER                         :: zq,iq,iadd,jadd,NQ,OffQ,OffR,LM
    REAL(DOUBLE)                    :: Zeta,PiZ,Dist
    REAL(DOUBLE),DIMENSION(3)       :: PQ
    TYPE(CRDS)                      :: GMLoc
    !-----------------------------------------------------------------------------------!
    IF(PRESENT(zq_low_o))THEN
      zq_low=zq_low_o
    ELSE
      zq_low=1
    ENDIF
    IF(PRESENT(zq_hig_o))THEN
      zq_hig=zq_hig_o
    ELSE
      zq_hig=Rho%NExpt
    ENDIF
    !------------------------------
    BDist   = Zero
    RhoC%D  = Zero
    RhoS%D  = Zero
    DO zq=zq_low,zq_hig
      NQ    = Rho%NQ%I(zq)
      Zeta  = Rho%Expt%D(zq)
      OffQ  = Rho%OffQ%I(zq)
      OffR  = Rho%OffR%I(zq)
      LQ    = Rho%Lndx%I(zq)
      LP    = FFELL
      LPQ   = MAX(LP,LQ)
      LenQ  = LSP(LQ)
      LenP  = LSP(LP)
      LenPQ = LSP(LPQ)
      LKet  = LHGTF(LQ)
      IF(NQ > 0) THEN
        DO iq=1,NQ
          iadd   = Rho%OffQ%I(zq)+iq
          jadd   = Rho%OffR%I(zq)+(iq-1)*LKet+1
          PQ(1)  = Rho%Qx%D(iadd)-GMLoc%PBC%CellCenter%D(1)
          PQ(2)  = Rho%Qy%D(iadd)-GMLoc%PBC%CellCenter%D(2)
          PQ(3)  = Rho%Qz%D(iadd)-GMLoc%PBC%CellCenter%D(3)
          PiZ=(Pi/Zeta)**(ThreeHalves)
          Dist = SQRT(PQ(1)**2+PQ(2)**2+PQ(3)**2)
          IF(Dist > BDist) THEN
            BDist      = Dist
            BOXDist(1) = PQ(1)
            BOXDist(2) = PQ(2)
            BOXDist(3) = PQ(3)
          ENDIF
          PFFKetC%D = Zero
          PFFKetS%D = Zero
          ! THE FOLLOWING IS INEFFICIENT
          CALL HGToSP_Gen(LQ,PiZ,Rho%Co%D(jadd:jadd+LKet-1),PFFKetC%D,PFFKetS%D)
          IF(NoTranslate(PQ)) THEN
            DO LM = 0,LSP(LQ)
              RhoC%D(LM) = RhoC%D(LM)+PFFKetC%D(LM)
              RhoS%D(LM) = RhoS%D(LM)+PFFKetS%D(LM)
            ENDDO
          ELSE
            CALL Regular(LPQ,PQ(1),PQ(2),PQ(3))
            CALL XLate77(LP,LQ,RhoC%D,RhoS%D,Cpq,Spq,PFFKetC%D,PFFKetS%D)
          ENDIF
        ENDDO
      ENDIF
    ENDDO
    RhoC%D(0) = Zero
    RhoS%D(0) = Zero
  END SUBROUTINE RhoToSP
  !=======================================================================================
  ! Calculate the Maxium Ell
  !=======================================================================================
  FUNCTION CalMaxEll(GMLoc) RESULT(ML1)
    TYPE(CRDS)                            :: GMLoc
    TYPE(CellSet)                         :: CStmp
    INTEGER                               :: NC,L,LP,ML1
    REAL(DOUBLE)                          :: Radius,MinRadius
    REAL(DOUBLE)                          :: PL,OL,FAC,NL,OL1,CQ
    REAL(DOUBLE)                          :: PFFTau
    REAL(DOUBLE),DIMENSION(3)             :: PQ
    !---------------------------------------------------------------------------------!


    ML1=GMLoc%PBC%PFFMaxEll
    CALL MondoLog(DEBUG_NONE, "CalMaxEll", "CalMaxEll hardwired for now at ..."//TRIM(IntToChar(ML1)))
    RETURN

    PFFTau = TauMAC
    !
    !     First, Determint the Distance to the Nearest Cell in the CellSet CS_inf-CS_IN
    !
    Radius = Zero
    DO NC=1,CS_IN%NCells
      PQ(:) = CS_IN%CellCarts%D(:,NC)
      Radius = MAX(Radius,SQRT(PQ(1)**2+PQ(2)**2+PQ(3)**2))
    ENDDO
    !
    CALL New_CellSet_Sphere(CStmp,GMLoc%PBC%AutoW%I,GMLoc%PBC%BoxShape%D,1.25D0*Radius)
    MinRadius = 1.D16
    DO NC=1,CStmp%NCells
      PQ(:) = CStmp%CellCarts%D(:,NC)
      IF(.NOT. InCell_CellSet(CS_IN,PQ(1),PQ(2),PQ(3))) THEN
        MinRadius = MIN(MinRadius,SQRT(PQ(1)**2+PQ(2)**2+PQ(3)**2))
      ENDIF
    ENDDO
    !
    IF(Two*BDist > MinRadius) THEN
      CALL Halt('2*BDist Greater Then Radius increase PFFMaxLay')
    ENDIF
    !
    ML1 = FFEll+1
    CQ  = Zero
    DO L=SPEll,FFELL
      OL1 = Unsold0(L,RhoC%D,RhoS%D)
      CQ  = MAX(CQ,OL1/BDist**DBLE(L))
    ENDDO
    !
    DO L=SPEll,FFEll
      PL  = CQ*(Two*BDist)**DBLE(L)
      FAC = PL/((MinRadius-Two*BDist)*MinRadius**DBLE(L+1))
      IF(FAC .LT. PFFTau) THEN
        ML1 = L
        EXIT
      ENDIF
    ENDDO
    !
    CALL OpenASCII(OutFile,Out)
    IF(GMLoc%PBC%PFFOvRide) THEN
      IF(MyID.EQ.ROOT) THEN
        WRITE(Out,990) ML1,GMLoc%PBC%PFFMaxEll
        WRITE(*,990) ML1,GMLoc%PBC%PFFMaxEll
      ENDIF
      ML1 = GMLoc%PBC%PFFMaxEll
    ELSE
      IF(ML1 .GT. GMLoc%PBC%PFFMaxEll) THEN
        IF(MyID.EQ.ROOT) THEN
          WRITE(Out,991) ML1,GMLoc%PBC%PFFMaxEll
          WRITE(*,991) ML1,GMLoc%PBC%PFFMaxEll
        ENDIF
        ML1=GMLoc%PBC%PFFMaxEll
      ENDIF
    ENDIF
    CLOSE(Out)
    !
990 FORMAT(' OverRide is On: Ell ==> ',I3,' PFFMaxEll ==> ',I3)
991 FORMAT(' *** WARNING *** Ell > MaxEll *** WARNING *** : Ell ==> ',I3,' PFFMaxEll ==> ',I3)
  END FUNCTION CalMaxEll
  !========================================================================================
  ! If QP is < TOL, do not translate
  !========================================================================================
  FUNCTION NoTranslate(X)
    REAL(DOUBLE),DIMENSION(3) :: X
    REAL(DOUBLE),PARAMETER    :: TOL=1.0D-12
    LOGICAL                   :: NoTranslate
    NoTranslate = (ABS(X(1)).LT.TOL) .AND. (ABS(X(2)).LT.TOL) .AND. (ABS(X(3)).LT.TOL)
  END FUNCTION NoTranslate
  !
END MODULE PBCFarField

