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
      SUBROUTINE CTraX404(Q)
         USE PoleNodeType
         USE PoleGlobals
         USE ERIGlobals
         TYPE(PoleNode) :: Q
!       -------------------------------- Lp=0, Mp = 0-------------------------------------
        COne=Cpq(0)*Q%C(0)+Cpq(1)*Q%C(1)+Cpq(3)*Q%C(3)+Cpq(6)*Q%C(6)+Cpq(10)*Q%C(10)
        W(1)=Cpq(2)*Q%C(2)+Cpq(4)*Q%C(4)+Cpq(5)*Q%C(5)+Cpq(7)*Q%C(7)+Cpq(8)*Q%C(8)
        W(2)=Cpq(9)*Q%C(9)+Cpq(11)*Q%C(11)+Cpq(12)*Q%C(12)+Cpq(13)*Q%C(13)+Cpq(14)*Q%C(14)
        W(3)=Spq(2)*Q%S(2)+Spq(4)*Q%S(4)+Spq(5)*Q%S(5)+Spq(7)*Q%S(7)+Spq(8)*Q%S(8)
        W(4)=Spq(9)*Q%S(9)+Spq(11)*Q%S(11)+Spq(12)*Q%S(12)+Spq(13)*Q%S(13)+Spq(14)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)
        SPKetC(0)=SPKetC(0)+COne+CTwo*Two
!       -------------------------------- Lp=1, Mp = 0-------------------------------------
        W(1)=-(Cpq(1)*Q%C(0))-Cpq(3)*Q%C(1)
        W(2)=-(Cpq(6)*Q%C(3))-Cpq(10)*Q%C(6)-Cpq(15)*Q%C(10)
        COne=W(1)+W(2)
        W(1)=-(Cpq(4)*Q%C(2))-Cpq(7)*Q%C(4)
        W(2)=-(Cpq(8)*Q%C(5))-Cpq(11)*Q%C(7)-Cpq(12)*Q%C(8)
        W(3)=-(Cpq(13)*Q%C(9))-Cpq(16)*Q%C(11)
        W(4)=-(Cpq(17)*Q%C(12))-Cpq(18)*Q%C(13)-Cpq(19)*Q%C(14)
        W(5)=-(Spq(4)*Q%S(2))-Spq(7)*Q%S(4)
        W(6)=-(Spq(8)*Q%S(5))-Spq(11)*Q%S(7)-Spq(12)*Q%S(8)
        W(7)=-(Spq(13)*Q%S(9))-Spq(16)*Q%S(11)
        W(8)=-(Spq(17)*Q%S(12))-Spq(18)*Q%S(13)-Spq(19)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)
        SPKetC(1)=SPKetC(1)+COne+CTwo*Two
!       -------------------------------- Lp=1, Mp = 1-------------------------------------
        W(1)=-(Cpq(2)*Q%C(0))-Cpq(4)*Q%C(1)+(Cpq(3)-Cpq(5))*Q%C(2)
        W(2)=-(Cpq(7)*Q%C(3))+(Cpq(6)-Cpq(8))*Q%C(4)+(Cpq(7)-Cpq(9))*Q%C(5)
        W(3)=-(Cpq(11)*Q%C(6))+(Cpq(10)-Cpq(12))*Q%C(7)+(Cpq(11)-Cpq(13))*Q%C(8)
        W(4)=(Cpq(12)-Cpq(14))*Q%C(9)-Cpq(16)*Q%C(10)+(Cpq(15)-Cpq(17))*Q%C(11)
        W(5)=(Cpq(16)-Cpq(18))*Q%C(12)
        W(6)=(Cpq(17)-Cpq(19))*Q%C(13)+(Cpq(18)-Cpq(20))*Q%C(14)
        W(7)=-(Spq(5)*Q%S(2))-Spq(8)*Q%S(4)+(Spq(7)-Spq(9))*Q%S(5)
        W(8)=-(Spq(12)*Q%S(7))+(Spq(11)-Spq(13))*Q%S(8)+(Spq(12)-Spq(14))*Q%S(9)
        W(9)=-(Spq(17)*Q%S(11))+(Spq(16)-Spq(18))*Q%S(12)
        W(10)=(Spq(17)-Spq(19))*Q%S(13)+(Spq(18)-Spq(20))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        W(1)=-(Q%C(0)*Spq(2))-Q%C(1)*Spq(4)-Q%C(2)*Spq(5)
        W(2)=-(Q%C(3)*Spq(7))-Q%C(4)*Spq(8)-Q%C(5)*(Spq(7)+Spq(9))
        W(3)=-(Q%C(6)*Spq(11))-Q%C(7)*Spq(12)-Q%C(8)*(Spq(11)+Spq(13))
        W(4)=-(Q%C(9)*(Spq(12)+Spq(14)))-Q%C(10)*Spq(16)-Q%C(11)*Spq(17)
        W(5)=-(Q%C(12)*(Spq(16)+Spq(18)))
        W(6)=-(Q%C(13)*(Spq(17)+Spq(19)))-Q%C(14)*(Spq(18)+Spq(20))
        W(7)=(Cpq(3)+Cpq(5))*Q%S(2)+(Cpq(6)+Cpq(8))*Q%S(4)+(Cpq(7)+Cpq(9))*Q%S(5)
        W(8)=(Cpq(10)+Cpq(12))*Q%S(7)+(Cpq(11)+Cpq(13))*Q%S(8)+(Cpq(12)+Cpq(14))*Q%S(9)
        W(9)=(Cpq(15)+Cpq(17))*Q%S(11)+(Cpq(16)+Cpq(18))*Q%S(12)
        W(10)=(Cpq(17)+Cpq(19))*Q%S(13)+(Cpq(18)+Cpq(20))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        SPKetC(2)=SPKetC(2)+CTwo*Two
        SPKetS(2)=SPKetS(2)+STwo*Two
!       -------------------------------- Lp=2, Mp = 0-------------------------------------
        COne=Cpq(3)*Q%C(0)+Cpq(6)*Q%C(1)+Cpq(10)*Q%C(3)+Cpq(15)*Q%C(6)+Cpq(21)*Q%C(10)
        W(1)=Cpq(7)*Q%C(2)+Cpq(11)*Q%C(4)+Cpq(12)*Q%C(5)+Cpq(16)*Q%C(7)+Cpq(17)*Q%C(8)
        W(2)=Cpq(18)*Q%C(9)+Cpq(22)*Q%C(11)+Cpq(23)*Q%C(12)+Cpq(24)*Q%C(13)+Cpq(25)*Q%C(14)
        W(3)=Spq(7)*Q%S(2)+Spq(11)*Q%S(4)+Spq(12)*Q%S(5)+Spq(16)*Q%S(7)+Spq(17)*Q%S(8)
        W(4)=Spq(18)*Q%S(9)+Spq(22)*Q%S(11)+Spq(23)*Q%S(12)+Spq(24)*Q%S(13)+Spq(25)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)
        SPKetC(3)=SPKetC(3)+COne+CTwo*Two
!       -------------------------------- Lp=2, Mp = 1-------------------------------------
        W(1)=Cpq(4)*Q%C(0)+Cpq(7)*Q%C(1)+(-Cpq(6)+Cpq(8))*Q%C(2)
        W(2)=Cpq(11)*Q%C(3)+(-Cpq(10)+Cpq(12))*Q%C(4)+(-Cpq(11)+Cpq(13))*Q%C(5)
        W(3)=Cpq(16)*Q%C(6)+(-Cpq(15)+Cpq(17))*Q%C(7)+(-Cpq(16)+Cpq(18))*Q%C(8)
        W(4)=(-Cpq(17)+Cpq(19))*Q%C(9)+Cpq(22)*Q%C(10)+(-Cpq(21)+Cpq(23))*Q%C(11)
        W(5)=(-Cpq(22)+Cpq(24))*Q%C(12)
        W(6)=(-Cpq(23)+Cpq(25))*Q%C(13)+(-Cpq(24)+Cpq(26))*Q%C(14)
        W(7)=Spq(8)*Q%S(2)+Spq(12)*Q%S(4)+(-Spq(11)+Spq(13))*Q%S(5)
        W(8)=Spq(17)*Q%S(7)+(-Spq(16)+Spq(18))*Q%S(8)+(-Spq(17)+Spq(19))*Q%S(9)
        W(9)=Spq(23)*Q%S(11)+(-Spq(22)+Spq(24))*Q%S(12)
        W(10)=(-Spq(23)+Spq(25))*Q%S(13)+(-Spq(24)+Spq(26))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        W(1)=Q%C(0)*Spq(4)+Q%C(1)*Spq(7)+Q%C(2)*Spq(8)
        W(2)=Q%C(3)*Spq(11)+Q%C(4)*Spq(12)+Q%C(5)*(Spq(11)+Spq(13))
        W(3)=Q%C(6)*Spq(16)+Q%C(7)*Spq(17)+Q%C(8)*(Spq(16)+Spq(18))
        W(4)=Q%C(9)*(Spq(17)+Spq(19))+Q%C(10)*Spq(22)+Q%C(11)*Spq(23)
        W(5)=Q%C(12)*(Spq(22)+Spq(24))+Q%C(13)*(Spq(23)+Spq(25))+Q%C(14)*(Spq(24)+Spq(26))
        W(6)=-((Cpq(6)+Cpq(8))*Q%S(2))
        W(7)=-((Cpq(10)+Cpq(12))*Q%S(4))-(Cpq(11)+Cpq(13))*Q%S(5)
        W(8)=-((Cpq(15)+Cpq(17))*Q%S(7))
        W(9)=-((Cpq(16)+Cpq(18))*Q%S(8))-(Cpq(17)+Cpq(19))*Q%S(9)
        W(10)=-((Cpq(21)+Cpq(23))*Q%S(11))-(Cpq(22)+Cpq(24))*Q%S(12)
        W(11)=-((Cpq(23)+Cpq(25))*Q%S(13))-(Cpq(24)+Cpq(26))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(4)=SPKetC(4)+CTwo*Two
        SPKetS(4)=SPKetS(4)+STwo*Two
!       -------------------------------- Lp=2, Mp = 2-------------------------------------
        W(1)=Cpq(5)*Q%C(0)+Cpq(8)*Q%C(1)+(-Cpq(7)+Cpq(9))*Q%C(2)
        W(2)=Cpq(12)*Q%C(3)+(-Cpq(11)+Cpq(13))*Q%C(4)+(Cpq(10)+Cpq(14))*Q%C(5)
        W(3)=Cpq(17)*Q%C(6)+(-Cpq(16)+Cpq(18))*Q%C(7)+(Cpq(15)+Cpq(19))*Q%C(8)
        W(4)=(Cpq(16)+Cpq(20))*Q%C(9)+Cpq(23)*Q%C(10)+(-Cpq(22)+Cpq(24))*Q%C(11)
        W(5)=(Cpq(21)+Cpq(25))*Q%C(12)+(Cpq(22)+Cpq(26))*Q%C(13)+(Cpq(23)+Cpq(27))*Q%C(14)
        W(6)=(Spq(7)+Spq(9))*Q%S(2)+(Spq(11)+Spq(13))*Q%S(4)+Spq(14)*Q%S(5)
        W(7)=(Spq(16)+Spq(18))*Q%S(7)+Spq(19)*Q%S(8)+(Spq(16)+Spq(20))*Q%S(9)
        W(8)=(Spq(22)+Spq(24))*Q%S(11)+Spq(25)*Q%S(12)
        W(9)=(Spq(22)+Spq(26))*Q%S(13)+(Spq(23)+Spq(27))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)
        W(1)=Q%C(0)*Spq(5)+Q%C(1)*Spq(8)+Q%C(2)*(-Spq(7)+Spq(9))
        W(2)=Q%C(3)*Spq(12)+Q%C(4)*(-Spq(11)+Spq(13))+Q%C(5)*Spq(14)
        W(3)=Q%C(6)*Spq(17)+Q%C(7)*(-Spq(16)+Spq(18))+Q%C(8)*Spq(19)
        W(4)=Q%C(9)*(-Spq(16)+Spq(20))+Q%C(10)*Spq(23)+Q%C(11)*(-Spq(22)+Spq(24))
        W(5)=Q%C(12)*Spq(25)+Q%C(13)*(-Spq(22)+Spq(26))+Q%C(14)*(-Spq(23)+Spq(27))
        W(6)=-((Cpq(7)+Cpq(9))*Q%S(2))
        W(7)=-((Cpq(11)+Cpq(13))*Q%S(4))+(Cpq(10)-Cpq(14))*Q%S(5)
        W(8)=-((Cpq(16)+Cpq(18))*Q%S(7))
        W(9)=(Cpq(15)-Cpq(19))*Q%S(8)+(Cpq(16)-Cpq(20))*Q%S(9)
        W(10)=-((Cpq(22)+Cpq(24))*Q%S(11))+(Cpq(21)-Cpq(25))*Q%S(12)
        W(11)=(Cpq(22)-Cpq(26))*Q%S(13)+(Cpq(23)-Cpq(27))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(5)=SPKetC(5)+CTwo*Two
        SPKetS(5)=SPKetS(5)+STwo*Two
!       -------------------------------- Lp=3, Mp = 0-------------------------------------
        W(1)=-(Cpq(6)*Q%C(0))-Cpq(10)*Q%C(1)
        W(2)=-(Cpq(15)*Q%C(3))-Cpq(21)*Q%C(6)-Cpq(28)*Q%C(10)
        COne=W(1)+W(2)
        W(1)=-(Cpq(11)*Q%C(2))-Cpq(16)*Q%C(4)
        W(2)=-(Cpq(17)*Q%C(5))-Cpq(22)*Q%C(7)-Cpq(23)*Q%C(8)
        W(3)=-(Cpq(24)*Q%C(9))-Cpq(29)*Q%C(11)
        W(4)=-(Cpq(30)*Q%C(12))-Cpq(31)*Q%C(13)-Cpq(32)*Q%C(14)
        W(5)=-(Spq(11)*Q%S(2))-Spq(16)*Q%S(4)
        W(6)=-(Spq(17)*Q%S(5))-Spq(22)*Q%S(7)-Spq(23)*Q%S(8)
        W(7)=-(Spq(24)*Q%S(9))-Spq(29)*Q%S(11)
        W(8)=-(Spq(30)*Q%S(12))-Spq(31)*Q%S(13)-Spq(32)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)
        SPKetC(6)=SPKetC(6)+COne+CTwo*Two
!       -------------------------------- Lp=3, Mp = 1-------------------------------------
        W(1)=-(Cpq(7)*Q%C(0))-Cpq(11)*Q%C(1)+(Cpq(10)-Cpq(12))*Q%C(2)
        W(2)=-(Cpq(16)*Q%C(3))+(Cpq(15)-Cpq(17))*Q%C(4)+(Cpq(16)-Cpq(18))*Q%C(5)
        W(3)=-(Cpq(22)*Q%C(6))+(Cpq(21)-Cpq(23))*Q%C(7)+(Cpq(22)-Cpq(24))*Q%C(8)
        W(4)=(Cpq(23)-Cpq(25))*Q%C(9)-Cpq(29)*Q%C(10)+(Cpq(28)-Cpq(30))*Q%C(11)
        W(5)=(Cpq(29)-Cpq(31))*Q%C(12)
        W(6)=(Cpq(30)-Cpq(32))*Q%C(13)+(Cpq(31)-Cpq(33))*Q%C(14)
        W(7)=-(Spq(12)*Q%S(2))-Spq(17)*Q%S(4)+(Spq(16)-Spq(18))*Q%S(5)
        W(8)=-(Spq(23)*Q%S(7))+(Spq(22)-Spq(24))*Q%S(8)+(Spq(23)-Spq(25))*Q%S(9)
        W(9)=-(Spq(30)*Q%S(11))+(Spq(29)-Spq(31))*Q%S(12)
        W(10)=(Spq(30)-Spq(32))*Q%S(13)+(Spq(31)-Spq(33))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        W(1)=-(Q%C(0)*Spq(7))-Q%C(1)*Spq(11)-Q%C(2)*Spq(12)
        W(2)=-(Q%C(3)*Spq(16))-Q%C(4)*Spq(17)-Q%C(5)*(Spq(16)+Spq(18))
        W(3)=-(Q%C(6)*Spq(22))-Q%C(7)*Spq(23)-Q%C(8)*(Spq(22)+Spq(24))
        W(4)=-(Q%C(9)*(Spq(23)+Spq(25)))-Q%C(10)*Spq(29)-Q%C(11)*Spq(30)
        W(5)=-(Q%C(12)*(Spq(29)+Spq(31)))
        W(6)=-(Q%C(13)*(Spq(30)+Spq(32)))-Q%C(14)*(Spq(31)+Spq(33))
        W(7)=(Cpq(10)+Cpq(12))*Q%S(2)+(Cpq(15)+Cpq(17))*Q%S(4)+(Cpq(16)+Cpq(18))*Q%S(5)
        W(8)=(Cpq(21)+Cpq(23))*Q%S(7)+(Cpq(22)+Cpq(24))*Q%S(8)+(Cpq(23)+Cpq(25))*Q%S(9)
        W(9)=(Cpq(28)+Cpq(30))*Q%S(11)+(Cpq(29)+Cpq(31))*Q%S(12)
        W(10)=(Cpq(30)+Cpq(32))*Q%S(13)+(Cpq(31)+Cpq(33))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        SPKetC(7)=SPKetC(7)+CTwo*Two
        SPKetS(7)=SPKetS(7)+STwo*Two
!       -------------------------------- Lp=3, Mp = 2-------------------------------------
        W(1)=-(Cpq(8)*Q%C(0))-Cpq(12)*Q%C(1)
        W(2)=Cpq(11)*Q%C(2)-Cpq(13)*Q%C(2)-Cpq(17)*Q%C(3)
        W(3)=Cpq(16)*Q%C(4)-Cpq(18)*Q%C(4)
        W(4)=-(Cpq(15)*Q%C(5))-Cpq(19)*Q%C(5)-Cpq(23)*Q%C(6)
        W(5)=Cpq(22)*Q%C(7)-Cpq(24)*Q%C(7)
        W(6)=-(Cpq(21)*Q%C(8))-Cpq(25)*Q%C(8)-Cpq(22)*Q%C(9)
        W(7)=-(Cpq(26)*Q%C(9))-Cpq(30)*Q%C(10)+Cpq(29)*Q%C(11)
        W(8)=-(Cpq(31)*Q%C(11))-Cpq(28)*Q%C(12)-Cpq(32)*Q%C(12)
        W(9)=-(Cpq(29)*Q%C(13))-Cpq(33)*Q%C(13)
        W(10)=-(Cpq(30)*Q%C(14))-Cpq(34)*Q%C(14)-Spq(11)*Q%S(2)
        W(11)=-(Spq(13)*Q%S(2))-Spq(16)*Q%S(4)
        W(12)=-(Spq(18)*Q%S(4))-Spq(19)*Q%S(5)-Spq(22)*Q%S(7)
        W(13)=-(Spq(24)*Q%S(7))-Spq(25)*Q%S(8)
        W(14)=-(Spq(22)*Q%S(9))-Spq(26)*Q%S(9)-Spq(29)*Q%S(11)
        W(15)=-(Spq(31)*Q%S(11))-Spq(32)*Q%S(12)-Spq(29)*Q%S(13)
        W(16)=-(Spq(33)*Q%S(13))-Spq(30)*Q%S(14)-Spq(34)*Q%S(14)
        W(17)=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)
        W(18)=W(9)+W(10)+W(11)+W(12)+W(13)+W(14)+W(15)+W(16)
        CTwo=W(17)+W(18)
        W(1)=-(Q%C(0)*Spq(8))-Q%C(1)*Spq(12)+Q%C(2)*(Spq(11)-Spq(13))
        W(2)=-(Q%C(3)*Spq(17))+Q%C(4)*(Spq(16)-Spq(18))-Q%C(5)*Spq(19)
        W(3)=-(Q%C(6)*Spq(23))+Q%C(7)*(Spq(22)-Spq(24))-Q%C(8)*Spq(25)
        W(4)=Q%C(9)*(Spq(22)-Spq(26))-Q%C(10)*Spq(30)+Q%C(11)*(Spq(29)-Spq(31))
        W(5)=-(Q%C(12)*Spq(32))+Q%C(13)*(Spq(29)-Spq(33))+Q%C(14)*(Spq(30)-Spq(34))
        W(6)=(Cpq(11)+Cpq(13))*Q%S(2)+(Cpq(16)+Cpq(18))*Q%S(4)+(-Cpq(15)+Cpq(19))*Q%S(5)
        W(7)=(Cpq(22)+Cpq(24))*Q%S(7)
        W(8)=(-Cpq(21)+Cpq(25))*Q%S(8)+(-Cpq(22)+Cpq(26))*Q%S(9)
        W(9)=(Cpq(29)+Cpq(31))*Q%S(11)+(-Cpq(28)+Cpq(32))*Q%S(12)
        W(10)=(-Cpq(29)+Cpq(33))*Q%S(13)+(-Cpq(30)+Cpq(34))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        SPKetC(8)=SPKetC(8)+CTwo*Two
        SPKetS(8)=SPKetS(8)+STwo*Two
!       -------------------------------- Lp=3, Mp = 3-------------------------------------
        W(1)=-(Cpq(9)*Q%C(0))-Cpq(13)*Q%C(1)
        W(2)=Cpq(12)*Q%C(2)-Cpq(14)*Q%C(2)-Cpq(18)*Q%C(3)
        W(3)=Cpq(17)*Q%C(4)-Cpq(19)*Q%C(4)
        W(4)=-(Cpq(16)*Q%C(5))-Cpq(20)*Q%C(5)-Cpq(24)*Q%C(6)
        W(5)=Cpq(23)*Q%C(7)-Cpq(25)*Q%C(7)
        W(6)=-(Cpq(22)*Q%C(8))-Cpq(26)*Q%C(8)+Cpq(21)*Q%C(9)
        W(7)=-(Cpq(27)*Q%C(9))-Cpq(31)*Q%C(10)+Cpq(30)*Q%C(11)
        W(8)=-(Cpq(32)*Q%C(11))-Cpq(29)*Q%C(12)-Cpq(33)*Q%C(12)
        W(9)=Cpq(28)*Q%C(13)-Cpq(34)*Q%C(13)
        W(10)=Cpq(29)*Q%C(14)-Cpq(35)*Q%C(14)-Spq(12)*Q%S(2)
        W(11)=-(Spq(14)*Q%S(2))-Spq(17)*Q%S(4)-Spq(19)*Q%S(4)
        W(12)=Spq(16)*Q%S(5)-Spq(20)*Q%S(5)-Spq(23)*Q%S(7)
        W(13)=-(Spq(25)*Q%S(7))+Spq(22)*Q%S(8)
        W(14)=-(Spq(26)*Q%S(8))-Spq(27)*Q%S(9)-Spq(30)*Q%S(11)
        W(15)=-(Spq(32)*Q%S(11))+Spq(29)*Q%S(12)-Spq(33)*Q%S(12)
        W(16)=-(Spq(34)*Q%S(13))+Spq(29)*Q%S(14)-Spq(35)*Q%S(14)
        W(17)=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)
        W(18)=W(9)+W(10)+W(11)+W(12)+W(13)+W(14)+W(15)+W(16)
        CTwo=W(17)+W(18)
        W(1)=-(Q%C(0)*Spq(9))-Q%C(1)*Spq(13)+Q%C(2)*(Spq(12)-Spq(14))
        W(2)=-(Q%C(3)*Spq(18))+Q%C(4)*(Spq(17)-Spq(19))-Q%C(5)*(Spq(16)+Spq(20))
        W(3)=-(Q%C(6)*Spq(24))+Q%C(7)*(Spq(23)-Spq(25))-Q%C(8)*(Spq(22)+Spq(26))
        W(4)=-(Q%C(9)*Spq(27))-Q%C(10)*Spq(31)+Q%C(11)*(Spq(30)-Spq(32))
        W(5)=-(Q%C(12)*(Spq(29)+Spq(33)))-Q%C(13)*Spq(34)-Q%C(14)*(Spq(29)+Spq(35))
        W(6)=(Cpq(12)+Cpq(14))*Q%S(2)+(Cpq(17)+Cpq(19))*Q%S(4)+(-Cpq(16)+Cpq(20))*Q%S(5)
        W(7)=(Cpq(23)+Cpq(25))*Q%S(7)+(-Cpq(22)+Cpq(26))*Q%S(8)+(Cpq(21)+Cpq(27))*Q%S(9)
        W(8)=(Cpq(30)+Cpq(32))*Q%S(11)+(-Cpq(29)+Cpq(33))*Q%S(12)
        W(9)=(Cpq(28)+Cpq(34))*Q%S(13)+(Cpq(29)+Cpq(35))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)
        SPKetC(9)=SPKetC(9)+CTwo*Two
        SPKetS(9)=SPKetS(9)+STwo*Two
!       -------------------------------- Lp=4, Mp = 0-------------------------------------
        COne=Cpq(10)*Q%C(0)+Cpq(15)*Q%C(1)+Cpq(21)*Q%C(3)+Cpq(28)*Q%C(6)+Cpq(36)*Q%C(10)
        W(1)=Cpq(16)*Q%C(2)+Cpq(22)*Q%C(4)+Cpq(23)*Q%C(5)+Cpq(29)*Q%C(7)+Cpq(30)*Q%C(8)
        W(2)=Cpq(31)*Q%C(9)+Cpq(37)*Q%C(11)+Cpq(38)*Q%C(12)+Cpq(39)*Q%C(13)+Cpq(40)*Q%C(14)
        W(3)=Spq(16)*Q%S(2)+Spq(22)*Q%S(4)+Spq(23)*Q%S(5)+Spq(29)*Q%S(7)+Spq(30)*Q%S(8)
        W(4)=Spq(31)*Q%S(9)+Spq(37)*Q%S(11)+Spq(38)*Q%S(12)+Spq(39)*Q%S(13)+Spq(40)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)
        SPKetC(10)=SPKetC(10)+COne+CTwo*Two
!       -------------------------------- Lp=4, Mp = 1-------------------------------------
        W(1)=Cpq(11)*Q%C(0)+Cpq(16)*Q%C(1)+(-Cpq(15)+Cpq(17))*Q%C(2)
        W(2)=Cpq(22)*Q%C(3)+(-Cpq(21)+Cpq(23))*Q%C(4)+(-Cpq(22)+Cpq(24))*Q%C(5)
        W(3)=Cpq(29)*Q%C(6)+(-Cpq(28)+Cpq(30))*Q%C(7)+(-Cpq(29)+Cpq(31))*Q%C(8)
        W(4)=(-Cpq(30)+Cpq(32))*Q%C(9)+Cpq(37)*Q%C(10)+(-Cpq(36)+Cpq(38))*Q%C(11)
        W(5)=(-Cpq(37)+Cpq(39))*Q%C(12)
        W(6)=(-Cpq(38)+Cpq(40))*Q%C(13)+(-Cpq(39)+Cpq(41))*Q%C(14)
        W(7)=Spq(17)*Q%S(2)+Spq(23)*Q%S(4)+(-Spq(22)+Spq(24))*Q%S(5)
        W(8)=Spq(30)*Q%S(7)+(-Spq(29)+Spq(31))*Q%S(8)+(-Spq(30)+Spq(32))*Q%S(9)
        W(9)=Spq(38)*Q%S(11)+(-Spq(37)+Spq(39))*Q%S(12)
        W(10)=(-Spq(38)+Spq(40))*Q%S(13)+(-Spq(39)+Spq(41))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        W(1)=Q%C(0)*Spq(11)+Q%C(1)*Spq(16)+Q%C(2)*Spq(17)
        W(2)=Q%C(3)*Spq(22)+Q%C(4)*Spq(23)+Q%C(5)*(Spq(22)+Spq(24))
        W(3)=Q%C(6)*Spq(29)+Q%C(7)*Spq(30)+Q%C(8)*(Spq(29)+Spq(31))
        W(4)=Q%C(9)*(Spq(30)+Spq(32))+Q%C(10)*Spq(37)+Q%C(11)*Spq(38)
        W(5)=Q%C(12)*(Spq(37)+Spq(39))+Q%C(13)*(Spq(38)+Spq(40))+Q%C(14)*(Spq(39)+Spq(41))
        W(6)=-((Cpq(15)+Cpq(17))*Q%S(2))
        W(7)=-((Cpq(21)+Cpq(23))*Q%S(4))-(Cpq(22)+Cpq(24))*Q%S(5)
        W(8)=-((Cpq(28)+Cpq(30))*Q%S(7))
        W(9)=-((Cpq(29)+Cpq(31))*Q%S(8))-(Cpq(30)+Cpq(32))*Q%S(9)
        W(10)=-((Cpq(36)+Cpq(38))*Q%S(11))-(Cpq(37)+Cpq(39))*Q%S(12)
        W(11)=-((Cpq(38)+Cpq(40))*Q%S(13))-(Cpq(39)+Cpq(41))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(11)=SPKetC(11)+CTwo*Two
        SPKetS(11)=SPKetS(11)+STwo*Two
!       -------------------------------- Lp=4, Mp = 2-------------------------------------
        W(1)=Cpq(12)*Q%C(0)+Cpq(17)*Q%C(1)+(-Cpq(16)+Cpq(18))*Q%C(2)
        W(2)=Cpq(23)*Q%C(3)+(-Cpq(22)+Cpq(24))*Q%C(4)+(Cpq(21)+Cpq(25))*Q%C(5)
        W(3)=Cpq(30)*Q%C(6)+(-Cpq(29)+Cpq(31))*Q%C(7)+(Cpq(28)+Cpq(32))*Q%C(8)
        W(4)=(Cpq(29)+Cpq(33))*Q%C(9)+Cpq(38)*Q%C(10)+(-Cpq(37)+Cpq(39))*Q%C(11)
        W(5)=(Cpq(36)+Cpq(40))*Q%C(12)+(Cpq(37)+Cpq(41))*Q%C(13)+(Cpq(38)+Cpq(42))*Q%C(14)
        W(6)=(Spq(16)+Spq(18))*Q%S(2)+(Spq(22)+Spq(24))*Q%S(4)+Spq(25)*Q%S(5)
        W(7)=(Spq(29)+Spq(31))*Q%S(7)+Spq(32)*Q%S(8)+(Spq(29)+Spq(33))*Q%S(9)
        W(8)=(Spq(37)+Spq(39))*Q%S(11)+Spq(40)*Q%S(12)
        W(9)=(Spq(37)+Spq(41))*Q%S(13)+(Spq(38)+Spq(42))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)
        W(1)=Q%C(0)*Spq(12)+Q%C(1)*Spq(17)+Q%C(2)*(-Spq(16)+Spq(18))
        W(2)=Q%C(3)*Spq(23)+Q%C(4)*(-Spq(22)+Spq(24))+Q%C(5)*Spq(25)
        W(3)=Q%C(6)*Spq(30)+Q%C(7)*(-Spq(29)+Spq(31))+Q%C(8)*Spq(32)
        W(4)=Q%C(9)*(-Spq(29)+Spq(33))+Q%C(10)*Spq(38)+Q%C(11)*(-Spq(37)+Spq(39))
        W(5)=Q%C(12)*Spq(40)+Q%C(13)*(-Spq(37)+Spq(41))+Q%C(14)*(-Spq(38)+Spq(42))
        W(6)=-((Cpq(16)+Cpq(18))*Q%S(2))
        W(7)=-((Cpq(22)+Cpq(24))*Q%S(4))+(Cpq(21)-Cpq(25))*Q%S(5)
        W(8)=-((Cpq(29)+Cpq(31))*Q%S(7))
        W(9)=(Cpq(28)-Cpq(32))*Q%S(8)+(Cpq(29)-Cpq(33))*Q%S(9)
        W(10)=-((Cpq(37)+Cpq(39))*Q%S(11))+(Cpq(36)-Cpq(40))*Q%S(12)
        W(11)=(Cpq(37)-Cpq(41))*Q%S(13)+(Cpq(38)-Cpq(42))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(12)=SPKetC(12)+CTwo*Two
        SPKetS(12)=SPKetS(12)+STwo*Two
!       -------------------------------- Lp=4, Mp = 3-------------------------------------
        W(1)=Cpq(13)*Q%C(0)+Cpq(18)*Q%C(1)+(-Cpq(17)+Cpq(19))*Q%C(2)
        W(2)=Cpq(24)*Q%C(3)+(-Cpq(23)+Cpq(25))*Q%C(4)+(Cpq(22)+Cpq(26))*Q%C(5)
        W(3)=Cpq(31)*Q%C(6)+(-Cpq(30)+Cpq(32))*Q%C(7)+(Cpq(29)+Cpq(33))*Q%C(8)
        W(4)=(-Cpq(28)+Cpq(34))*Q%C(9)+Cpq(39)*Q%C(10)+(-Cpq(38)+Cpq(40))*Q%C(11)
        W(5)=(Cpq(37)+Cpq(41))*Q%C(12)
        W(6)=(-Cpq(36)+Cpq(42))*Q%C(13)+(-Cpq(37)+Cpq(43))*Q%C(14)
        W(7)=(Spq(17)+Spq(19))*Q%S(2)+(Spq(23)+Spq(25))*Q%S(4)+(-Spq(22)+Spq(26))*Q%S(5)
        W(8)=(Spq(30)+Spq(32))*Q%S(7)+(-Spq(29)+Spq(33))*Q%S(8)+Spq(34)*Q%S(9)
        W(9)=(Spq(38)+Spq(40))*Q%S(11)+(-Spq(37)+Spq(41))*Q%S(12)
        W(10)=Spq(42)*Q%S(13)+(-Spq(37)+Spq(43))*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)
        W(1)=Q%C(0)*Spq(13)+Q%C(1)*Spq(18)+Q%C(2)*(-Spq(17)+Spq(19))
        W(2)=Q%C(3)*Spq(24)+Q%C(4)*(-Spq(23)+Spq(25))+Q%C(5)*(Spq(22)+Spq(26))
        W(3)=Q%C(6)*Spq(31)+Q%C(7)*(-Spq(30)+Spq(32))+Q%C(8)*(Spq(29)+Spq(33))
        W(4)=Q%C(9)*Spq(34)+Q%C(10)*Spq(39)+Q%C(11)*(-Spq(38)+Spq(40))
        W(5)=Q%C(12)*(Spq(37)+Spq(41))+Q%C(13)*Spq(42)+Q%C(14)*(Spq(37)+Spq(43))
        W(6)=-((Cpq(17)+Cpq(19))*Q%S(2))
        W(7)=-((Cpq(23)+Cpq(25))*Q%S(4))+(Cpq(22)-Cpq(26))*Q%S(5)
        W(8)=-((Cpq(30)+Cpq(32))*Q%S(7))
        W(9)=(Cpq(29)-Cpq(33))*Q%S(8)-(Cpq(28)+Cpq(34))*Q%S(9)
        W(10)=-((Cpq(38)+Cpq(40))*Q%S(11))+(Cpq(37)-Cpq(41))*Q%S(12)
        W(11)=-((Cpq(36)+Cpq(42))*Q%S(13))-(Cpq(37)+Cpq(43))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(13)=SPKetC(13)+CTwo*Two
        SPKetS(13)=SPKetS(13)+STwo*Two
!       -------------------------------- Lp=4, Mp = 4-------------------------------------
        W(1)=Cpq(14)*Q%C(0)+Cpq(19)*Q%C(1)+(-Cpq(18)+Cpq(20))*Q%C(2)
        W(2)=Cpq(25)*Q%C(3)+(-Cpq(24)+Cpq(26))*Q%C(4)+(Cpq(23)+Cpq(27))*Q%C(5)
        W(3)=Cpq(32)*Q%C(6)+(-Cpq(31)+Cpq(33))*Q%C(7)+(Cpq(30)+Cpq(34))*Q%C(8)
        W(4)=(-Cpq(29)+Cpq(35))*Q%C(9)+Cpq(40)*Q%C(10)+(-Cpq(39)+Cpq(41))*Q%C(11)
        W(5)=(Cpq(38)+Cpq(42))*Q%C(12)+(-Cpq(37)+Cpq(43))*Q%C(13)+(Cpq(36)+Cpq(44))*Q%C(14)
        W(6)=(Spq(18)+Spq(20))*Q%S(2)+(Spq(24)+Spq(26))*Q%S(4)+(-Spq(23)+Spq(27))*Q%S(5)
        W(7)=(Spq(31)+Spq(33))*Q%S(7)+(-Spq(30)+Spq(34))*Q%S(8)+(Spq(29)+Spq(35))*Q%S(9)
        W(8)=(Spq(39)+Spq(41))*Q%S(11)+(-Spq(38)+Spq(42))*Q%S(12)
        W(9)=(Spq(37)+Spq(43))*Q%S(13)+Spq(44)*Q%S(14)
        CTwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)
        W(1)=Q%C(0)*Spq(14)+Q%C(1)*Spq(19)+Q%C(2)*(-Spq(18)+Spq(20))
        W(2)=Q%C(3)*Spq(25)+Q%C(4)*(-Spq(24)+Spq(26))+Q%C(5)*(Spq(23)+Spq(27))
        W(3)=Q%C(6)*Spq(32)+Q%C(7)*(-Spq(31)+Spq(33))+Q%C(8)*(Spq(30)+Spq(34))
        W(4)=Q%C(9)*(-Spq(29)+Spq(35))+Q%C(10)*Spq(40)+Q%C(11)*(-Spq(39)+Spq(41))
        W(5)=Q%C(12)*(Spq(38)+Spq(42))+Q%C(13)*(-Spq(37)+Spq(43))+Q%C(14)*Spq(44)
        W(6)=-((Cpq(18)+Cpq(20))*Q%S(2))
        W(7)=-((Cpq(24)+Cpq(26))*Q%S(4))+(Cpq(23)-Cpq(27))*Q%S(5)
        W(8)=-((Cpq(31)+Cpq(33))*Q%S(7))
        W(9)=(Cpq(30)-Cpq(34))*Q%S(8)-(Cpq(29)+Cpq(35))*Q%S(9)
        W(10)=-((Cpq(39)+Cpq(41))*Q%S(11))+(Cpq(38)-Cpq(42))*Q%S(12)
        W(11)=-((Cpq(37)+Cpq(43))*Q%S(13))+(Cpq(36)-Cpq(44))*Q%S(14)
        STwo=W(1)+W(2)+W(3)+W(4)+W(5)+W(6)+W(7)+W(8)+W(9)+W(10)+W(11)
        SPKetC(14)=SPKetC(14)+CTwo*Two
        SPKetS(14)=SPKetS(14)+STwo*Two
      END SUBROUTINE CTraX404
