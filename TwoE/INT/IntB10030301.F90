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
! ----------------------------------------------------------
! COMPUTES THE INTEGRAL CLASS (f p|p s)
! ----------------------------------------------------------
   SUBROUTINE IntB10030301(PrmBufB,LBra,PrmBufK,LKet,ACInfo,BDInfo, &
                              OA,LDA,OB,LDB,OC,LDC,OD,LDD,PBC,INTGRL)
      USE DerivedTypes
      USE VScratchB
      USE GlobalScalars
      USE ShellPairStruct
      USE GammaF5
      IMPLICIT REAL(DOUBLE) (W)
      INTEGER        :: LBra,LKet,CDOffSet
      REAL(DOUBLE)   :: PrmBufB(10,LBra),PrmBufK(10,LKet)
      TYPE(SmallAtomInfo) :: ACInfo,BDInfo
      TYPE(PBCInfo) :: PBC
      REAL(DOUBLE)  :: INTGRL(*)
      REAL(DOUBLE)  :: Ax,Ay,Az,Bx,By,Bz,Cx,Cy,Cz
      REAL(DOUBLE)  :: Dx,Dy,Dz,Qx,Qy,Qz,Px,Py,Pz
      REAL(DOUBLE)  :: PQx,PQy,PQz,FPQx,FPQy,FPQz
      REAL(DOUBLE)  :: Zeta,Eta,Omega,Up,Uq,Upq
      REAL(DOUBLE)  :: T,ET,TwoT,InvT,SqInvT
      REAL(DOUBLE)  :: VRR(35,4,0:5)
      REAL(DOUBLE)  :: HRR(35,4,1)
      INTEGER       :: OffSet,OA,LDA,OB,LDB,OC,LDC,OD,LDD,I,J,K,L
      EXTERNAL InitDbl
      CALL InitDbl(35*4,HRR(1,1,1))
      Ax=ACInfo%Atm1X
      Ay=ACInfo%Atm1Y
      Az=ACInfo%Atm1Z
      Bx=ACInfo%Atm2X
      By=ACInfo%Atm2Y
      Bz=ACInfo%Atm2Z
      Cx=BDInfo%Atm1X
      Cy=BDInfo%Atm1Y
      Cz=BDInfo%Atm1Z
      Dx=BDInfo%Atm2X
      Dy=BDInfo%Atm2Y
      Dz=BDInfo%Atm2Z
      ABx=Ax-Bx
      ABy=Ay-By
      ABz=Az-Bz
      CDx=Cx-Dx
      CDy=Cy-Dy
      CDz=Cz-Dz
      DO J=1,LKet ! K^2 VRR |N0) loop
         Eta=PrmBufK(1,J)
         Qx=PrmBufK(2,J)
         Qy=PrmBufK(3,J)
         Qz=PrmBufK(4,J)
         Uq=PrmBufK(5,J)
         QCx=Qx-Cx
         QCy=Qy-Cy
         QCz=Qz-Cz
         DO K=1,LBra ! K^2 VRR (M0| loop
            Zeta=PrmBufB(1,K)
            Px=PrmBufB(2,K)
            Py=PrmBufB(3,K)
            Pz=PrmBufB(4,K)
            Up=PrmBufB(5,K)
            r1xZpE=One/(Zeta+Eta)
            Upq=SQRT(r1xZpE)*Up*Uq
            HfxZpE=Half/(Zeta+Eta)
            r1x2E=Half/Eta
            r1x2Z=Half/Zeta
            ExZpE=Eta*r1xZpE
            ZxZpE=Zeta*r1xZpE
            Omega=Eta*Zeta*r1xZpE
            PAx=Px-Ax
            PAy=Py-Ay
            PAz=Pz-Az
            PQx=Px-Qx
            PQy=Py-Qy
            PQz=Pz-Qz
            ! Begin Minimum Image Convention
            FPQx = PQx*PBC%InvBoxSh%D(1,1)+PQy*PBC%InvBoxSh%D(1,2)+PQz*PBC%InvBoxSh%D(1,3)
            FPQy = PQy*PBC%InvBoxSh%D(2,2)+PQz*PBC%InvBoxSh%D(2,3)
            FPQz = PQz*PBC%InvBoxSh%D(3,3)
            IF(PBC%AutoW%I(1)==1)FPQx=FPQx-ANINT(FPQx-SIGN(1D-15,FPQx))
            IF(PBC%AutoW%I(2)==1)FPQy=FPQy-ANINT(FPQy-SIGN(1D-15,FPQy))
            IF(PBC%AutoW%I(3)==1)FPQz=FPQz-ANINT(FPQz-SIGN(1D-15,FPQz))
            PQx=FPQx*PBC%BoxShape%D(1,1)+FPQy*PBC%BoxShape%D(1,2)+FPQz*PBC%BoxShape%D(1,3)
            PQy=FPQy*PBC%BoxShape%D(2,2)+FPQz*PBC%BoxShape%D(2,3)
            PQz=FPQz*PBC%BoxShape%D(3,3)
            ! End MIC
            WPx = -Eta*PQx*r1xZpE
            WPy = -Eta*PQy*r1xZpE
            WPz = -Eta*PQz*r1xZpE
            WQx = Zeta*PQx*r1xZpE
            WQy = Zeta*PQy*r1xZpE
            WQz = Zeta*PQz*r1xZpE
            T=Omega*(PQx*PQx+PQy*PQy+PQz*PQz)
            IF(T<Gamma_Switch)THEN
              L=AINT(T*Gamma_Grid)
              ET=EXP(-T)
              TwoT=Two*T
              W5=(F5_0(L)+T*(F5_1(L)+T*(F5_2(L)+T*(F5_3(L)+T*F5_4(L)))))
              W4=+1.111111111111111D-01*(TwoT*W5+ET)
              W3=+1.428571428571428D-01*(TwoT*W4+ET)
              W2=+2.000000000000000D-01*(TwoT*W3+ET)
              W1=+3.333333333333333D-01*(TwoT*W2+ET)
              W0=TwoT*W1+ET
              VRR(1,1,0)=Upq*W0
              VRR(1,1,1)=Upq*W1
              VRR(1,1,2)=Upq*W2
              VRR(1,1,3)=Upq*W3
              VRR(1,1,4)=Upq*W4
              VRR(1,1,5)=Upq*W5
            ELSE
              InvT=One/T
              SqInvT=DSQRT(InvT)
              VRR(1,1,0)=+8.862269254527580D-01*Upq*SqInvT
              SqInvT=SqInvT*InvT
              VRR(1,1,1)=+4.431134627263790D-01*Upq*SqInvT
              SqInvT=SqInvT*InvT
              VRR(1,1,2)=+6.646701940895685D-01*Upq*SqInvT
              SqInvT=SqInvT*InvT
              VRR(1,1,3)=+1.661675485223921D+00*Upq*SqInvT
              SqInvT=SqInvT*InvT
              VRR(1,1,4)=+5.815864198283724D+00*Upq*SqInvT
              SqInvT=SqInvT*InvT
              VRR(1,1,5)=+2.617138889227676D+01*Upq*SqInvT
            ENDIF
            ! Generating (p0|s0)^(4)
            VRR(2,1,4)=PAx*VRR(1,1,4)+WPx*VRR(1,1,5)
            VRR(3,1,4)=PAy*VRR(1,1,4)+WPy*VRR(1,1,5)
            VRR(4,1,4)=PAz*VRR(1,1,4)+WPz*VRR(1,1,5)
            ! Generating (p0|s0)^(3)
            VRR(2,1,3)=PAx*VRR(1,1,3)+WPx*VRR(1,1,4)
            VRR(3,1,3)=PAy*VRR(1,1,3)+WPy*VRR(1,1,4)
            VRR(4,1,3)=PAz*VRR(1,1,3)+WPz*VRR(1,1,4)
            ! Generating (p0|s0)^(2)
            VRR(2,1,2)=PAx*VRR(1,1,2)+WPx*VRR(1,1,3)
            VRR(3,1,2)=PAy*VRR(1,1,2)+WPy*VRR(1,1,3)
            VRR(4,1,2)=PAz*VRR(1,1,2)+WPz*VRR(1,1,3)
            ! Generating (p0|s0)^(1)
            VRR(2,1,1)=PAx*VRR(1,1,1)+WPx*VRR(1,1,2)
            VRR(3,1,1)=PAy*VRR(1,1,1)+WPy*VRR(1,1,2)
            VRR(4,1,1)=PAz*VRR(1,1,1)+WPz*VRR(1,1,2)
            ! Generating (p0|s0)^(0)
            VRR(2,1,0)=PAx*VRR(1,1,0)+WPx*VRR(1,1,1)
            VRR(3,1,0)=PAy*VRR(1,1,0)+WPy*VRR(1,1,1)
            VRR(4,1,0)=PAz*VRR(1,1,0)+WPz*VRR(1,1,1)
            ! Generating (d0|s0)^(3)
            VRR(5,1,3)=PAx*VRR(2,1,3)+r1x2Z*(VRR(1,1,3)-ExZpE*VRR(1,1,4))+WPx*VRR(2,1,4)
            VRR(6,1,3)=PAx*VRR(3,1,3)+WPx*VRR(3,1,4)
            VRR(7,1,3)=PAy*VRR(3,1,3)+r1x2Z*(VRR(1,1,3)-ExZpE*VRR(1,1,4))+WPy*VRR(3,1,4)
            VRR(8,1,3)=PAx*VRR(4,1,3)+WPx*VRR(4,1,4)
            VRR(9,1,3)=PAy*VRR(4,1,3)+WPy*VRR(4,1,4)
            VRR(10,1,3)=PAz*VRR(4,1,3)+r1x2Z*(VRR(1,1,3)-ExZpE*VRR(1,1,4))+WPz*VRR(4,1,4)
            ! Generating (d0|s0)^(2)
            VRR(5,1,2)=PAx*VRR(2,1,2)+r1x2Z*(VRR(1,1,2)-ExZpE*VRR(1,1,3))+WPx*VRR(2,1,3)
            VRR(6,1,2)=PAx*VRR(3,1,2)+WPx*VRR(3,1,3)
            VRR(7,1,2)=PAy*VRR(3,1,2)+r1x2Z*(VRR(1,1,2)-ExZpE*VRR(1,1,3))+WPy*VRR(3,1,3)
            VRR(8,1,2)=PAx*VRR(4,1,2)+WPx*VRR(4,1,3)
            VRR(9,1,2)=PAy*VRR(4,1,2)+WPy*VRR(4,1,3)
            VRR(10,1,2)=PAz*VRR(4,1,2)+r1x2Z*(VRR(1,1,2)-ExZpE*VRR(1,1,3))+WPz*VRR(4,1,3)
            ! Generating (d0|s0)^(1)
            VRR(5,1,1)=PAx*VRR(2,1,1)+r1x2Z*(VRR(1,1,1)-ExZpE*VRR(1,1,2))+WPx*VRR(2,1,2)
            VRR(6,1,1)=PAx*VRR(3,1,1)+WPx*VRR(3,1,2)
            VRR(7,1,1)=PAy*VRR(3,1,1)+r1x2Z*(VRR(1,1,1)-ExZpE*VRR(1,1,2))+WPy*VRR(3,1,2)
            VRR(8,1,1)=PAx*VRR(4,1,1)+WPx*VRR(4,1,2)
            VRR(9,1,1)=PAy*VRR(4,1,1)+WPy*VRR(4,1,2)
            VRR(10,1,1)=PAz*VRR(4,1,1)+r1x2Z*(VRR(1,1,1)-ExZpE*VRR(1,1,2))+WPz*VRR(4,1,2)
            ! Generating (d0|s0)^(0)
            VRR(5,1,0)=PAx*VRR(2,1,0)+r1x2Z*(VRR(1,1,0)-ExZpE*VRR(1,1,1))+WPx*VRR(2,1,1)
            VRR(6,1,0)=PAx*VRR(3,1,0)+WPx*VRR(3,1,1)
            VRR(7,1,0)=PAy*VRR(3,1,0)+r1x2Z*(VRR(1,1,0)-ExZpE*VRR(1,1,1))+WPy*VRR(3,1,1)
            VRR(8,1,0)=PAx*VRR(4,1,0)+WPx*VRR(4,1,1)
            VRR(9,1,0)=PAy*VRR(4,1,0)+WPy*VRR(4,1,1)
            VRR(10,1,0)=PAz*VRR(4,1,0)+r1x2Z*(VRR(1,1,0)-ExZpE*VRR(1,1,1))+WPz*VRR(4,1,1)
            ! Generating (f0|s0)^(2)
            CALL VRRf0s0(35,4,VRR(1,1,2),VRR(1,1,3))
            ! Generating (f0|s0)^(1)
            CALL VRRf0s0(35,4,VRR(1,1,1),VRR(1,1,2))
            ! Generating (f0|s0)^(0)
            CALL VRRf0s0(35,4,VRR(1,1,0),VRR(1,1,1))
            ! Generating (g0|s0)^(1)
            CALL VRRg0s0(35,4,VRR(1,1,1),VRR(1,1,2))
            ! Generating (g0|s0)^(0)
            CALL VRRg0s0(35,4,VRR(1,1,0),VRR(1,1,1))
            ! Generating (s0|p0)^(4)
            VRR(1,2,4)=QCx*VRR(1,1,4)+WQx*VRR(1,1,5)
            VRR(1,3,4)=QCy*VRR(1,1,4)+WQy*VRR(1,1,5)
            VRR(1,4,4)=QCz*VRR(1,1,4)+WQz*VRR(1,1,5)
            ! Generating (s0|p0)^(3)
            VRR(1,2,3)=QCx*VRR(1,1,3)+WQx*VRR(1,1,4)
            VRR(1,3,3)=QCy*VRR(1,1,3)+WQy*VRR(1,1,4)
            VRR(1,4,3)=QCz*VRR(1,1,3)+WQz*VRR(1,1,4)
            ! Generating (s0|p0)^(2)
            VRR(1,2,2)=QCx*VRR(1,1,2)+WQx*VRR(1,1,3)
            VRR(1,3,2)=QCy*VRR(1,1,2)+WQy*VRR(1,1,3)
            VRR(1,4,2)=QCz*VRR(1,1,2)+WQz*VRR(1,1,3)
            ! Generating (s0|p0)^(1)
            VRR(1,2,1)=QCx*VRR(1,1,1)+WQx*VRR(1,1,2)
            VRR(1,3,1)=QCy*VRR(1,1,1)+WQy*VRR(1,1,2)
            VRR(1,4,1)=QCz*VRR(1,1,1)+WQz*VRR(1,1,2)
            ! Generating (s0|p0)^(0)
            VRR(1,2,0)=QCx*VRR(1,1,0)+WQx*VRR(1,1,1)
            VRR(1,3,0)=QCy*VRR(1,1,0)+WQy*VRR(1,1,1)
            VRR(1,4,0)=QCz*VRR(1,1,0)+WQz*VRR(1,1,1)
            ! Generating (p0|p0)^(3)
            VRR(2,2,3)=QCx*VRR(2,1,3)+HfxZpE*VRR(1,1,4)+WQx*VRR(2,1,4)
            VRR(2,3,3)=QCy*VRR(2,1,3)+WQy*VRR(2,1,4)
            VRR(2,4,3)=QCz*VRR(2,1,3)+WQz*VRR(2,1,4)
            VRR(3,2,3)=QCx*VRR(3,1,3)+WQx*VRR(3,1,4)
            VRR(3,3,3)=QCy*VRR(3,1,3)+HfxZpE*VRR(1,1,4)+WQy*VRR(3,1,4)
            VRR(3,4,3)=QCz*VRR(3,1,3)+WQz*VRR(3,1,4)
            VRR(4,2,3)=QCx*VRR(4,1,3)+WQx*VRR(4,1,4)
            VRR(4,3,3)=QCy*VRR(4,1,3)+WQy*VRR(4,1,4)
            VRR(4,4,3)=QCz*VRR(4,1,3)+HfxZpE*VRR(1,1,4)+WQz*VRR(4,1,4)
            ! Generating (p0|p0)^(2)
            VRR(2,2,2)=QCx*VRR(2,1,2)+HfxZpE*VRR(1,1,3)+WQx*VRR(2,1,3)
            VRR(2,3,2)=QCy*VRR(2,1,2)+WQy*VRR(2,1,3)
            VRR(2,4,2)=QCz*VRR(2,1,2)+WQz*VRR(2,1,3)
            VRR(3,2,2)=QCx*VRR(3,1,2)+WQx*VRR(3,1,3)
            VRR(3,3,2)=QCy*VRR(3,1,2)+HfxZpE*VRR(1,1,3)+WQy*VRR(3,1,3)
            VRR(3,4,2)=QCz*VRR(3,1,2)+WQz*VRR(3,1,3)
            VRR(4,2,2)=QCx*VRR(4,1,2)+WQx*VRR(4,1,3)
            VRR(4,3,2)=QCy*VRR(4,1,2)+WQy*VRR(4,1,3)
            VRR(4,4,2)=QCz*VRR(4,1,2)+HfxZpE*VRR(1,1,3)+WQz*VRR(4,1,3)
            ! Generating (p0|p0)^(1)
            VRR(2,2,1)=QCx*VRR(2,1,1)+HfxZpE*VRR(1,1,2)+WQx*VRR(2,1,2)
            VRR(2,3,1)=QCy*VRR(2,1,1)+WQy*VRR(2,1,2)
            VRR(2,4,1)=QCz*VRR(2,1,1)+WQz*VRR(2,1,2)
            VRR(3,2,1)=QCx*VRR(3,1,1)+WQx*VRR(3,1,2)
            VRR(3,3,1)=QCy*VRR(3,1,1)+HfxZpE*VRR(1,1,2)+WQy*VRR(3,1,2)
            VRR(3,4,1)=QCz*VRR(3,1,1)+WQz*VRR(3,1,2)
            VRR(4,2,1)=QCx*VRR(4,1,1)+WQx*VRR(4,1,2)
            VRR(4,3,1)=QCy*VRR(4,1,1)+WQy*VRR(4,1,2)
            VRR(4,4,1)=QCz*VRR(4,1,1)+HfxZpE*VRR(1,1,2)+WQz*VRR(4,1,2)
            ! Generating (p0|p0)^(0)
            VRR(2,2,0)=QCx*VRR(2,1,0)+HfxZpE*VRR(1,1,1)+WQx*VRR(2,1,1)
            VRR(2,3,0)=QCy*VRR(2,1,0)+WQy*VRR(2,1,1)
            VRR(2,4,0)=QCz*VRR(2,1,0)+WQz*VRR(2,1,1)
            VRR(3,2,0)=QCx*VRR(3,1,0)+WQx*VRR(3,1,1)
            VRR(3,3,0)=QCy*VRR(3,1,0)+HfxZpE*VRR(1,1,1)+WQy*VRR(3,1,1)
            VRR(3,4,0)=QCz*VRR(3,1,0)+WQz*VRR(3,1,1)
            VRR(4,2,0)=QCx*VRR(4,1,0)+WQx*VRR(4,1,1)
            VRR(4,3,0)=QCy*VRR(4,1,0)+WQy*VRR(4,1,1)
            VRR(4,4,0)=QCz*VRR(4,1,0)+HfxZpE*VRR(1,1,1)+WQz*VRR(4,1,1)
            ! Generating (d0|p0)^(2)
            CALL VRRd0p0(35,4,VRR(1,1,2),VRR(1,1,3))
            ! Generating (d0|p0)^(1)
            CALL VRRd0p0(35,4,VRR(1,1,1),VRR(1,1,2))
            ! Generating (d0|p0)^(0)
            CALL VRRd0p0(35,4,VRR(1,1,0),VRR(1,1,1))
            ! Generating (f0|p0)^(1)
            CALL VRRf0p0(35,4,VRR(1,1,1),VRR(1,1,2))
            ! Generating (f0|p0)^(0)
            CALL VRRf0p0(35,4,VRR(1,1,0),VRR(1,1,1))
            ! Generating (g0|p0)^(0)
            CALL VRRg0p0(35,4,VRR(1,1,0),VRR(1,1,1))
            ! Contracting ...
            CALL CNTRCT10331(VRR,HRR)
         ENDDO ! (M0| loop
      ENDDO ! |N0) loop
      ! No need to generate (f,0|p,s)^(0)
      ! Generating (f,p|p,s)^(0)
      DO L=1,1
         DO K=2,4
            CDOffSet=(OC+K-2)*LDC+(OD+L-1)*LDD
            CALL BraHRR103(OA,OB,LDA,LDB,CDOffSet,HRR(1,K,L),INTGRL)
          ENDDO
      ENDDO
    END SUBROUTINE IntB10030301
    SUBROUTINE CNTRCT10331(VRR,HRR)
      USE DerivedTypes
      USE VScratchB
      REAL(DOUBLE)  :: VRR(35,4,0:5)
      REAL(DOUBLE)  :: HRR(35,4,1)
      HRR(1,1,1)=HRR(1,1,1)+VRR(1,1,0)
      HRR(1,2,1)=HRR(1,2,1)+VRR(1,2,0)
      HRR(1,3,1)=HRR(1,3,1)+VRR(1,3,0)
      HRR(1,4,1)=HRR(1,4,1)+VRR(1,4,0)
      HRR(2,1,1)=HRR(2,1,1)+VRR(2,1,0)
      HRR(2,2,1)=HRR(2,2,1)+VRR(2,2,0)
      HRR(2,3,1)=HRR(2,3,1)+VRR(2,3,0)
      HRR(2,4,1)=HRR(2,4,1)+VRR(2,4,0)
      HRR(3,1,1)=HRR(3,1,1)+VRR(3,1,0)
      HRR(3,2,1)=HRR(3,2,1)+VRR(3,2,0)
      HRR(3,3,1)=HRR(3,3,1)+VRR(3,3,0)
      HRR(3,4,1)=HRR(3,4,1)+VRR(3,4,0)
      HRR(4,1,1)=HRR(4,1,1)+VRR(4,1,0)
      HRR(4,2,1)=HRR(4,2,1)+VRR(4,2,0)
      HRR(4,3,1)=HRR(4,3,1)+VRR(4,3,0)
      HRR(4,4,1)=HRR(4,4,1)+VRR(4,4,0)
      HRR(5,1,1)=HRR(5,1,1)+VRR(5,1,0)
      HRR(5,2,1)=HRR(5,2,1)+VRR(5,2,0)
      HRR(5,3,1)=HRR(5,3,1)+VRR(5,3,0)
      HRR(5,4,1)=HRR(5,4,1)+VRR(5,4,0)
      HRR(6,1,1)=HRR(6,1,1)+VRR(6,1,0)
      HRR(6,2,1)=HRR(6,2,1)+VRR(6,2,0)
      HRR(6,3,1)=HRR(6,3,1)+VRR(6,3,0)
      HRR(6,4,1)=HRR(6,4,1)+VRR(6,4,0)
      HRR(7,1,1)=HRR(7,1,1)+VRR(7,1,0)
      HRR(7,2,1)=HRR(7,2,1)+VRR(7,2,0)
      HRR(7,3,1)=HRR(7,3,1)+VRR(7,3,0)
      HRR(7,4,1)=HRR(7,4,1)+VRR(7,4,0)
      HRR(8,1,1)=HRR(8,1,1)+VRR(8,1,0)
      HRR(8,2,1)=HRR(8,2,1)+VRR(8,2,0)
      HRR(8,3,1)=HRR(8,3,1)+VRR(8,3,0)
      HRR(8,4,1)=HRR(8,4,1)+VRR(8,4,0)
      HRR(9,1,1)=HRR(9,1,1)+VRR(9,1,0)
      HRR(9,2,1)=HRR(9,2,1)+VRR(9,2,0)
      HRR(9,3,1)=HRR(9,3,1)+VRR(9,3,0)
      HRR(9,4,1)=HRR(9,4,1)+VRR(9,4,0)
      HRR(10,1,1)=HRR(10,1,1)+VRR(10,1,0)
      HRR(10,2,1)=HRR(10,2,1)+VRR(10,2,0)
      HRR(10,3,1)=HRR(10,3,1)+VRR(10,3,0)
      HRR(10,4,1)=HRR(10,4,1)+VRR(10,4,0)
      HRR(11,1,1)=HRR(11,1,1)+VRR(11,1,0)
      HRR(11,2,1)=HRR(11,2,1)+VRR(11,2,0)
      HRR(11,3,1)=HRR(11,3,1)+VRR(11,3,0)
      HRR(11,4,1)=HRR(11,4,1)+VRR(11,4,0)
      HRR(12,1,1)=HRR(12,1,1)+VRR(12,1,0)
      HRR(12,2,1)=HRR(12,2,1)+VRR(12,2,0)
      HRR(12,3,1)=HRR(12,3,1)+VRR(12,3,0)
      HRR(12,4,1)=HRR(12,4,1)+VRR(12,4,0)
      HRR(13,1,1)=HRR(13,1,1)+VRR(13,1,0)
      HRR(13,2,1)=HRR(13,2,1)+VRR(13,2,0)
      HRR(13,3,1)=HRR(13,3,1)+VRR(13,3,0)
      HRR(13,4,1)=HRR(13,4,1)+VRR(13,4,0)
      HRR(14,1,1)=HRR(14,1,1)+VRR(14,1,0)
      HRR(14,2,1)=HRR(14,2,1)+VRR(14,2,0)
      HRR(14,3,1)=HRR(14,3,1)+VRR(14,3,0)
      HRR(14,4,1)=HRR(14,4,1)+VRR(14,4,0)
      HRR(15,1,1)=HRR(15,1,1)+VRR(15,1,0)
      HRR(15,2,1)=HRR(15,2,1)+VRR(15,2,0)
      HRR(15,3,1)=HRR(15,3,1)+VRR(15,3,0)
      HRR(15,4,1)=HRR(15,4,1)+VRR(15,4,0)
      HRR(16,1,1)=HRR(16,1,1)+VRR(16,1,0)
      HRR(16,2,1)=HRR(16,2,1)+VRR(16,2,0)
      HRR(16,3,1)=HRR(16,3,1)+VRR(16,3,0)
      HRR(16,4,1)=HRR(16,4,1)+VRR(16,4,0)
      HRR(17,1,1)=HRR(17,1,1)+VRR(17,1,0)
      HRR(17,2,1)=HRR(17,2,1)+VRR(17,2,0)
      HRR(17,3,1)=HRR(17,3,1)+VRR(17,3,0)
      HRR(17,4,1)=HRR(17,4,1)+VRR(17,4,0)
      HRR(18,1,1)=HRR(18,1,1)+VRR(18,1,0)
      HRR(18,2,1)=HRR(18,2,1)+VRR(18,2,0)
      HRR(18,3,1)=HRR(18,3,1)+VRR(18,3,0)
      HRR(18,4,1)=HRR(18,4,1)+VRR(18,4,0)
      HRR(19,1,1)=HRR(19,1,1)+VRR(19,1,0)
      HRR(19,2,1)=HRR(19,2,1)+VRR(19,2,0)
      HRR(19,3,1)=HRR(19,3,1)+VRR(19,3,0)
      HRR(19,4,1)=HRR(19,4,1)+VRR(19,4,0)
      HRR(20,1,1)=HRR(20,1,1)+VRR(20,1,0)
      HRR(20,2,1)=HRR(20,2,1)+VRR(20,2,0)
      HRR(20,3,1)=HRR(20,3,1)+VRR(20,3,0)
      HRR(20,4,1)=HRR(20,4,1)+VRR(20,4,0)
      HRR(21,1,1)=HRR(21,1,1)+VRR(21,1,0)
      HRR(21,2,1)=HRR(21,2,1)+VRR(21,2,0)
      HRR(21,3,1)=HRR(21,3,1)+VRR(21,3,0)
      HRR(21,4,1)=HRR(21,4,1)+VRR(21,4,0)
      HRR(22,1,1)=HRR(22,1,1)+VRR(22,1,0)
      HRR(22,2,1)=HRR(22,2,1)+VRR(22,2,0)
      HRR(22,3,1)=HRR(22,3,1)+VRR(22,3,0)
      HRR(22,4,1)=HRR(22,4,1)+VRR(22,4,0)
      HRR(23,1,1)=HRR(23,1,1)+VRR(23,1,0)
      HRR(23,2,1)=HRR(23,2,1)+VRR(23,2,0)
      HRR(23,3,1)=HRR(23,3,1)+VRR(23,3,0)
      HRR(23,4,1)=HRR(23,4,1)+VRR(23,4,0)
      HRR(24,1,1)=HRR(24,1,1)+VRR(24,1,0)
      HRR(24,2,1)=HRR(24,2,1)+VRR(24,2,0)
      HRR(24,3,1)=HRR(24,3,1)+VRR(24,3,0)
      HRR(24,4,1)=HRR(24,4,1)+VRR(24,4,0)
      HRR(25,1,1)=HRR(25,1,1)+VRR(25,1,0)
      HRR(25,2,1)=HRR(25,2,1)+VRR(25,2,0)
      HRR(25,3,1)=HRR(25,3,1)+VRR(25,3,0)
      HRR(25,4,1)=HRR(25,4,1)+VRR(25,4,0)
      HRR(26,1,1)=HRR(26,1,1)+VRR(26,1,0)
      HRR(26,2,1)=HRR(26,2,1)+VRR(26,2,0)
      HRR(26,3,1)=HRR(26,3,1)+VRR(26,3,0)
      HRR(26,4,1)=HRR(26,4,1)+VRR(26,4,0)
      HRR(27,1,1)=HRR(27,1,1)+VRR(27,1,0)
      HRR(27,2,1)=HRR(27,2,1)+VRR(27,2,0)
      HRR(27,3,1)=HRR(27,3,1)+VRR(27,3,0)
      HRR(27,4,1)=HRR(27,4,1)+VRR(27,4,0)
      HRR(28,1,1)=HRR(28,1,1)+VRR(28,1,0)
      HRR(28,2,1)=HRR(28,2,1)+VRR(28,2,0)
      HRR(28,3,1)=HRR(28,3,1)+VRR(28,3,0)
      HRR(28,4,1)=HRR(28,4,1)+VRR(28,4,0)
      HRR(29,1,1)=HRR(29,1,1)+VRR(29,1,0)
      HRR(29,2,1)=HRR(29,2,1)+VRR(29,2,0)
      HRR(29,3,1)=HRR(29,3,1)+VRR(29,3,0)
      HRR(29,4,1)=HRR(29,4,1)+VRR(29,4,0)
      HRR(30,1,1)=HRR(30,1,1)+VRR(30,1,0)
      HRR(30,2,1)=HRR(30,2,1)+VRR(30,2,0)
      HRR(30,3,1)=HRR(30,3,1)+VRR(30,3,0)
      HRR(30,4,1)=HRR(30,4,1)+VRR(30,4,0)
      HRR(31,1,1)=HRR(31,1,1)+VRR(31,1,0)
      HRR(31,2,1)=HRR(31,2,1)+VRR(31,2,0)
      HRR(31,3,1)=HRR(31,3,1)+VRR(31,3,0)
      HRR(31,4,1)=HRR(31,4,1)+VRR(31,4,0)
      HRR(32,1,1)=HRR(32,1,1)+VRR(32,1,0)
      HRR(32,2,1)=HRR(32,2,1)+VRR(32,2,0)
      HRR(32,3,1)=HRR(32,3,1)+VRR(32,3,0)
      HRR(32,4,1)=HRR(32,4,1)+VRR(32,4,0)
      HRR(33,1,1)=HRR(33,1,1)+VRR(33,1,0)
      HRR(33,2,1)=HRR(33,2,1)+VRR(33,2,0)
      HRR(33,3,1)=HRR(33,3,1)+VRR(33,3,0)
      HRR(33,4,1)=HRR(33,4,1)+VRR(33,4,0)
      HRR(34,1,1)=HRR(34,1,1)+VRR(34,1,0)
      HRR(34,2,1)=HRR(34,2,1)+VRR(34,2,0)
      HRR(34,3,1)=HRR(34,3,1)+VRR(34,3,0)
      HRR(34,4,1)=HRR(34,4,1)+VRR(34,4,0)
      HRR(35,1,1)=HRR(35,1,1)+VRR(35,1,0)
      HRR(35,2,1)=HRR(35,2,1)+VRR(35,2,0)
      HRR(35,3,1)=HRR(35,3,1)+VRR(35,3,0)
      HRR(35,4,1)=HRR(35,4,1)+VRR(35,4,0)
    END SUBROUTINE CNTRCT10331
