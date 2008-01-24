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
      SUBROUTINE HGTraX700(PQx,PQy,PQz,Q)
        USE ERIGlobals
        USE PoleNodeType
        TYPE(PoleNode) :: Q
        REAL(DOUBLE) :: PQx,PQy,PQz
        HGKet(1)=HGKet(1) + Q%Co(1)*r(1)
        HGKet(2)=HGKet(2) + Q%Co(1)*r(2)
        HGKet(3)=HGKet(3) + Q%Co(1)*r(3)
        HGKet(4)=HGKet(4) + Q%Co(1)*r(4)
        HGKet(5)=HGKet(5) + Q%Co(1)*r(5)
        HGKet(6)=HGKet(6) + Q%Co(1)*r(6)
        HGKet(7)=HGKet(7) + Q%Co(1)*r(7)
        HGKet(8)=HGKet(8) + Q%Co(1)*r(8)
        HGKet(9)=HGKet(9) + Q%Co(1)*r(9)
        HGKet(10)=HGKet(10) + Q%Co(1)*r(10)
        HGKet(11)=HGKet(11) + Q%Co(1)*r(11)
        HGKet(12)=HGKet(12) + Q%Co(1)*r(12)
        HGKet(13)=HGKet(13) + Q%Co(1)*r(13)
        HGKet(14)=HGKet(14) + Q%Co(1)*r(14)
        HGKet(15)=HGKet(15) + Q%Co(1)*r(15)
        HGKet(16)=HGKet(16) + Q%Co(1)*r(16)
        HGKet(17)=HGKet(17) + Q%Co(1)*r(17)
        HGKet(18)=HGKet(18) + Q%Co(1)*r(18)
        HGKet(19)=HGKet(19) + Q%Co(1)*r(19)
        HGKet(20)=HGKet(20) + Q%Co(1)*r(20)
        HGKet(21)=HGKet(21) + Q%Co(1)*r(21)
        HGKet(22)=HGKet(22) + Q%Co(1)*r(22)
        HGKet(23)=HGKet(23) + Q%Co(1)*r(23)
        HGKet(24)=HGKet(24) + Q%Co(1)*r(24)
        HGKet(25)=HGKet(25) + Q%Co(1)*r(25)
        HGKet(26)=HGKet(26) + Q%Co(1)*r(26)
        HGKet(27)=HGKet(27) + Q%Co(1)*r(27)
        HGKet(28)=HGKet(28) + Q%Co(1)*r(28)
        HGKet(29)=HGKet(29) + Q%Co(1)*r(29)
        HGKet(30)=HGKet(30) + Q%Co(1)*r(30)
        HGKet(31)=HGKet(31) + Q%Co(1)*r(31)
        HGKet(32)=HGKet(32) + Q%Co(1)*r(32)
        HGKet(33)=HGKet(33) + Q%Co(1)*r(33)
        HGKet(34)=HGKet(34) + Q%Co(1)*r(34)
        HGKet(35)=HGKet(35) + Q%Co(1)*r(35)
        HGKet(36)=HGKet(36) + Q%Co(1)*r(36)
        HGKet(37)=HGKet(37) + Q%Co(1)*r(37)
        HGKet(38)=HGKet(38) + Q%Co(1)*r(38)
        HGKet(39)=HGKet(39) + Q%Co(1)*r(39)
        HGKet(40)=HGKet(40) + Q%Co(1)*r(40)
        HGKet(41)=HGKet(41) + Q%Co(1)*r(41)
        HGKet(42)=HGKet(42) + Q%Co(1)*r(42)
        HGKet(43)=HGKet(43) + Q%Co(1)*r(43)
        HGKet(44)=HGKet(44) + Q%Co(1)*r(44)
        HGKet(45)=HGKet(45) + Q%Co(1)*r(45)
        HGKet(46)=HGKet(46) + Q%Co(1)*r(46)
        HGKet(47)=HGKet(47) + Q%Co(1)*r(47)
        HGKet(48)=HGKet(48) + Q%Co(1)*r(48)
        HGKet(49)=HGKet(49) + Q%Co(1)*r(49)
        HGKet(50)=HGKet(50) + Q%Co(1)*r(50)
        HGKet(51)=HGKet(51) + Q%Co(1)*r(51)
        HGKet(52)=HGKet(52) + Q%Co(1)*r(52)
        HGKet(53)=HGKet(53) + Q%Co(1)*r(53)
        HGKet(54)=HGKet(54) + Q%Co(1)*r(54)
        HGKet(55)=HGKet(55) + Q%Co(1)*r(55)
        HGKet(56)=HGKet(56) + Q%Co(1)*r(56)
        HGKet(57)=HGKet(57) + Q%Co(1)*r(57)
        HGKet(58)=HGKet(58) + Q%Co(1)*r(58)
        HGKet(59)=HGKet(59) + Q%Co(1)*r(59)
        HGKet(60)=HGKet(60) + Q%Co(1)*r(60)
        HGKet(61)=HGKet(61) + Q%Co(1)*r(61)
        HGKet(62)=HGKet(62) + Q%Co(1)*r(62)
        HGKet(63)=HGKet(63) + Q%Co(1)*r(63)
        HGKet(64)=HGKet(64) + Q%Co(1)*r(64)
        HGKet(65)=HGKet(65) + Q%Co(1)*r(65)
        HGKet(66)=HGKet(66) + Q%Co(1)*r(66)
        HGKet(67)=HGKet(67) + Q%Co(1)*r(67)
        HGKet(68)=HGKet(68) + Q%Co(1)*r(68)
        HGKet(69)=HGKet(69) + Q%Co(1)*r(69)
        HGKet(70)=HGKet(70) + Q%Co(1)*r(70)
        HGKet(71)=HGKet(71) + Q%Co(1)*r(71)
        HGKet(72)=HGKet(72) + Q%Co(1)*r(72)
        HGKet(73)=HGKet(73) + Q%Co(1)*r(73)
        HGKet(74)=HGKet(74) + Q%Co(1)*r(74)
        HGKet(75)=HGKet(75) + Q%Co(1)*r(75)
        HGKet(76)=HGKet(76) + Q%Co(1)*r(76)
        HGKet(77)=HGKet(77) + Q%Co(1)*r(77)
        HGKet(78)=HGKet(78) + Q%Co(1)*r(78)
        HGKet(79)=HGKet(79) + Q%Co(1)*r(79)
        HGKet(80)=HGKet(80) + Q%Co(1)*r(80)
        HGKet(81)=HGKet(81) + Q%Co(1)*r(81)
        HGKet(82)=HGKet(82) + Q%Co(1)*r(82)
        HGKet(83)=HGKet(83) + Q%Co(1)*r(83)
        HGKet(84)=HGKet(84) + Q%Co(1)*r(84)
        HGKet(85)=HGKet(85) + Q%Co(1)*r(85)
        HGKet(86)=HGKet(86) + Q%Co(1)*r(86)
        HGKet(87)=HGKet(87) + Q%Co(1)*r(87)
        HGKet(88)=HGKet(88) + Q%Co(1)*r(88)
        HGKet(89)=HGKet(89) + Q%Co(1)*r(89)
        HGKet(90)=HGKet(90) + Q%Co(1)*r(90)
        HGKet(91)=HGKet(91) + Q%Co(1)*r(91)
        HGKet(92)=HGKet(92) + Q%Co(1)*r(92)
        HGKet(93)=HGKet(93) + Q%Co(1)*r(93)
        HGKet(94)=HGKet(94) + Q%Co(1)*r(94)
        HGKet(95)=HGKet(95) + Q%Co(1)*r(95)
        HGKet(96)=HGKet(96) + Q%Co(1)*r(96)
        HGKet(97)=HGKet(97) + Q%Co(1)*r(97)
        HGKet(98)=HGKet(98) + Q%Co(1)*r(98)
        HGKet(99)=HGKet(99) + Q%Co(1)*r(99)
        HGKet(100)=HGKet(100) + Q%Co(1)*r(100)
        HGKet(101)=HGKet(101) + Q%Co(1)*r(101)
        HGKet(102)=HGKet(102) + Q%Co(1)*r(102)
        HGKet(103)=HGKet(103) + Q%Co(1)*r(103)
        HGKet(104)=HGKet(104) + Q%Co(1)*r(104)
        HGKet(105)=HGKet(105) + Q%Co(1)*r(105)
        HGKet(106)=HGKet(106) + Q%Co(1)*r(106)
        HGKet(107)=HGKet(107) + Q%Co(1)*r(107)
        HGKet(108)=HGKet(108) + Q%Co(1)*r(108)
        HGKet(109)=HGKet(109) + Q%Co(1)*r(109)
        HGKet(110)=HGKet(110) + Q%Co(1)*r(110)
        HGKet(111)=HGKet(111) + Q%Co(1)*r(111)
        HGKet(112)=HGKet(112) + Q%Co(1)*r(112)
        HGKet(113)=HGKet(113) + Q%Co(1)*r(113)
        HGKet(114)=HGKet(114) + Q%Co(1)*r(114)
        HGKet(115)=HGKet(115) + Q%Co(1)*r(115)
        HGKet(116)=HGKet(116) + Q%Co(1)*r(116)
        HGKet(117)=HGKet(117) + Q%Co(1)*r(117)
        HGKet(118)=HGKet(118) + Q%Co(1)*r(118)
        HGKet(119)=HGKet(119) + Q%Co(1)*r(119)
        HGKet(120)=HGKet(120) + Q%Co(1)*r(120)
      END SUBROUTINE HGTraX700
