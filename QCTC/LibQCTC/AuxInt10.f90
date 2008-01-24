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
      SUBROUTINE AuxInt10(PQx,PQy,PQz)
        USE ERIGlobals
        REAL(DOUBLE) :: PQx,PQy,PQz
        r(1) = AuxR(10)
        r(2) = PQx*r(1)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(9)
        r(5) = r(1) + PQx*r(2)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(6) = PQx*r(3)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(8)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(13) = PQx*r(7)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(12) = r(3) + PQx*r(6)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(7)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(24) = PQx*r(14)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(23) = r(7) + PQx*r(13)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(6)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(40) = PQx*r(25)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(39) = r(14) + PQx*r(24)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(5)
        r(57) = 5.d0*r(21) + PQx*r(36)
        r(63) = 5.d0*r(25) + PQy*r(41)
        r(84) = 5.d0*r(35) + PQz*r(56)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(62) = PQx*r(41)
        r(83) = PQy*r(56)
        r(82) = PQx*r(56)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(61) = r(25) + PQx*r(40)
        r(81) = r(35) + PQy*r(55)
        r(79) = r(35) + PQx*r(54)
        r(40) = PQx*r(25)
        r(80) = PQx*r(55)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(60) = 2.d0*r(24) + PQx*r(39)
        r(78) = 2.d0*r(34) + PQy*r(53)
        r(75) = 2.d0*r(33) + PQx*r(51)
        r(39) = r(14) + PQx*r(24)
        r(77) = PQx*r(53)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(76) = r(34) + PQx*r(52)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(59) = 3.d0*r(23) + PQx*r(38)
        r(74) = 3.d0*r(32) + PQy*r(50)
        r(70) = 3.d0*r(30) + PQx*r(47)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(73) = PQx*r(50)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(72) = r(32) + PQx*r(49)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(71) = 2.d0*r(31) + PQx*r(48)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(58) = 4.d0*r(22) + PQx*r(37)
        r(69) = 4.d0*r(29) + PQy*r(46)
        r(64) = 4.d0*r(26) + PQx*r(42)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(68) = PQx*r(46)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(67) = r(29) + PQx*r(45)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(66) = 2.d0*r(28) + PQx*r(44)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(65) = 3.d0*r(27) + PQx*r(43)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(4)
        r(85) = 6.d0*r(36) + PQx*r(57)
        r(92) = 6.d0*r(41) + PQy*r(63)
        r(120) = 6.d0*r(56) + PQz*r(84)
        r(57) = 5.d0*r(21) + PQx*r(36)
        r(91) = PQx*r(63)
        r(119) = PQy*r(84)
        r(118) = PQx*r(84)
        r(63) = 5.d0*r(25) + PQy*r(41)
        r(84) = 5.d0*r(35) + PQz*r(56)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(90) = r(41) + PQx*r(62)
        r(117) = r(56) + PQy*r(83)
        r(115) = r(56) + PQx*r(82)
        r(62) = PQx*r(41)
        r(116) = PQx*r(83)
        r(83) = PQy*r(56)
        r(82) = PQx*r(56)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(89) = 2.d0*r(40) + PQx*r(61)
        r(114) = 2.d0*r(55) + PQy*r(81)
        r(111) = 2.d0*r(54) + PQx*r(79)
        r(61) = r(25) + PQx*r(40)
        r(113) = PQx*r(81)
        r(81) = r(35) + PQy*r(55)
        r(79) = r(35) + PQx*r(54)
        r(40) = PQx*r(25)
        r(112) = r(55) + PQx*r(80)
        r(80) = PQx*r(55)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(88) = 3.d0*r(39) + PQx*r(60)
        r(110) = 3.d0*r(53) + PQy*r(78)
        r(106) = 3.d0*r(51) + PQx*r(75)
        r(60) = 2.d0*r(24) + PQx*r(39)
        r(109) = PQx*r(78)
        r(78) = 2.d0*r(34) + PQy*r(53)
        r(75) = 2.d0*r(33) + PQx*r(51)
        r(39) = r(14) + PQx*r(24)
        r(108) = r(53) + PQx*r(77)
        r(77) = PQx*r(53)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(107) = 2.d0*r(52) + PQx*r(76)
        r(76) = r(34) + PQx*r(52)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(87) = 4.d0*r(38) + PQx*r(59)
        r(105) = 4.d0*r(50) + PQy*r(74)
        r(100) = 4.d0*r(47) + PQx*r(70)
        r(59) = 3.d0*r(23) + PQx*r(38)
        r(104) = PQx*r(74)
        r(74) = 3.d0*r(32) + PQy*r(50)
        r(70) = 3.d0*r(30) + PQx*r(47)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(103) = r(50) + PQx*r(73)
        r(73) = PQx*r(50)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(102) = 2.d0*r(49) + PQx*r(72)
        r(72) = r(32) + PQx*r(49)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(101) = 3.d0*r(48) + PQx*r(71)
        r(71) = 2.d0*r(31) + PQx*r(48)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(86) = 5.d0*r(37) + PQx*r(58)
        r(99) = 5.d0*r(46) + PQy*r(69)
        r(93) = 5.d0*r(42) + PQx*r(64)
        r(58) = 4.d0*r(22) + PQx*r(37)
        r(98) = PQx*r(69)
        r(69) = 4.d0*r(29) + PQy*r(46)
        r(64) = 4.d0*r(26) + PQx*r(42)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(97) = r(46) + PQx*r(68)
        r(68) = PQx*r(46)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(96) = 2.d0*r(45) + PQx*r(67)
        r(67) = r(29) + PQx*r(45)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(95) = 3.d0*r(44) + PQx*r(66)
        r(66) = 2.d0*r(28) + PQx*r(44)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(94) = 4.d0*r(43) + PQx*r(65)
        r(65) = 3.d0*r(27) + PQx*r(43)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(3)
        r(121) = 7.d0*r(57) + PQx*r(85)
        r(129) = 7.d0*r(63) + PQy*r(92)
        r(165) = 7.d0*r(84) + PQz*r(120)
        r(85) = 6.d0*r(36) + PQx*r(57)
        r(128) = PQx*r(92)
        r(164) = PQy*r(120)
        r(163) = PQx*r(120)
        r(92) = 6.d0*r(41) + PQy*r(63)
        r(120) = 6.d0*r(56) + PQz*r(84)
        r(57) = 5.d0*r(21) + PQx*r(36)
        r(127) = r(63) + PQx*r(91)
        r(162) = r(84) + PQy*r(119)
        r(160) = r(84) + PQx*r(118)
        r(91) = PQx*r(63)
        r(161) = PQx*r(119)
        r(119) = PQy*r(84)
        r(118) = PQx*r(84)
        r(63) = 5.d0*r(25) + PQy*r(41)
        r(84) = 5.d0*r(35) + PQz*r(56)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(126) = 2.d0*r(62) + PQx*r(90)
        r(159) = 2.d0*r(83) + PQy*r(117)
        r(156) = 2.d0*r(82) + PQx*r(115)
        r(90) = r(41) + PQx*r(62)
        r(158) = PQx*r(117)
        r(117) = r(56) + PQy*r(83)
        r(115) = r(56) + PQx*r(82)
        r(62) = PQx*r(41)
        r(157) = r(83) + PQx*r(116)
        r(116) = PQx*r(83)
        r(83) = PQy*r(56)
        r(82) = PQx*r(56)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(125) = 3.d0*r(61) + PQx*r(89)
        r(155) = 3.d0*r(81) + PQy*r(114)
        r(151) = 3.d0*r(79) + PQx*r(111)
        r(89) = 2.d0*r(40) + PQx*r(61)
        r(154) = PQx*r(114)
        r(114) = 2.d0*r(55) + PQy*r(81)
        r(111) = 2.d0*r(54) + PQx*r(79)
        r(61) = r(25) + PQx*r(40)
        r(153) = r(81) + PQx*r(113)
        r(113) = PQx*r(81)
        r(81) = r(35) + PQy*r(55)
        r(79) = r(35) + PQx*r(54)
        r(40) = PQx*r(25)
        r(152) = 2.d0*r(80) + PQx*r(112)
        r(112) = r(55) + PQx*r(80)
        r(80) = PQx*r(55)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(124) = 4.d0*r(60) + PQx*r(88)
        r(150) = 4.d0*r(78) + PQy*r(110)
        r(145) = 4.d0*r(75) + PQx*r(106)
        r(88) = 3.d0*r(39) + PQx*r(60)
        r(149) = PQx*r(110)
        r(110) = 3.d0*r(53) + PQy*r(78)
        r(106) = 3.d0*r(51) + PQx*r(75)
        r(60) = 2.d0*r(24) + PQx*r(39)
        r(148) = r(78) + PQx*r(109)
        r(109) = PQx*r(78)
        r(78) = 2.d0*r(34) + PQy*r(53)
        r(75) = 2.d0*r(33) + PQx*r(51)
        r(39) = r(14) + PQx*r(24)
        r(147) = 2.d0*r(77) + PQx*r(108)
        r(108) = r(53) + PQx*r(77)
        r(77) = PQx*r(53)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(146) = 3.d0*r(76) + PQx*r(107)
        r(107) = 2.d0*r(52) + PQx*r(76)
        r(76) = r(34) + PQx*r(52)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(123) = 5.d0*r(59) + PQx*r(87)
        r(144) = 5.d0*r(74) + PQy*r(105)
        r(138) = 5.d0*r(70) + PQx*r(100)
        r(87) = 4.d0*r(38) + PQx*r(59)
        r(143) = PQx*r(105)
        r(105) = 4.d0*r(50) + PQy*r(74)
        r(100) = 4.d0*r(47) + PQx*r(70)
        r(59) = 3.d0*r(23) + PQx*r(38)
        r(142) = r(74) + PQx*r(104)
        r(104) = PQx*r(74)
        r(74) = 3.d0*r(32) + PQy*r(50)
        r(70) = 3.d0*r(30) + PQx*r(47)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(141) = 2.d0*r(73) + PQx*r(103)
        r(103) = r(50) + PQx*r(73)
        r(73) = PQx*r(50)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(140) = 3.d0*r(72) + PQx*r(102)
        r(102) = 2.d0*r(49) + PQx*r(72)
        r(72) = r(32) + PQx*r(49)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(139) = 4.d0*r(71) + PQx*r(101)
        r(101) = 3.d0*r(48) + PQx*r(71)
        r(71) = 2.d0*r(31) + PQx*r(48)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(122) = 6.d0*r(58) + PQx*r(86)
        r(137) = 6.d0*r(69) + PQy*r(99)
        r(130) = 6.d0*r(64) + PQx*r(93)
        r(86) = 5.d0*r(37) + PQx*r(58)
        r(136) = PQx*r(99)
        r(99) = 5.d0*r(46) + PQy*r(69)
        r(93) = 5.d0*r(42) + PQx*r(64)
        r(58) = 4.d0*r(22) + PQx*r(37)
        r(135) = r(69) + PQx*r(98)
        r(98) = PQx*r(69)
        r(69) = 4.d0*r(29) + PQy*r(46)
        r(64) = 4.d0*r(26) + PQx*r(42)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(134) = 2.d0*r(68) + PQx*r(97)
        r(97) = r(46) + PQx*r(68)
        r(68) = PQx*r(46)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(133) = 3.d0*r(67) + PQx*r(96)
        r(96) = 2.d0*r(45) + PQx*r(67)
        r(67) = r(29) + PQx*r(45)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(132) = 4.d0*r(66) + PQx*r(95)
        r(95) = 3.d0*r(44) + PQx*r(66)
        r(66) = 2.d0*r(28) + PQx*r(44)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(131) = 5.d0*r(65) + PQx*r(94)
        r(94) = 4.d0*r(43) + PQx*r(65)
        r(65) = 3.d0*r(27) + PQx*r(43)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(2)
        r(166) = 8.d0*r(85) + PQx*r(121)
        r(175) = 8.d0*r(92) + PQy*r(129)
        r(220) = 8.d0*r(120) + PQz*r(165)
        r(121) = 7.d0*r(57) + PQx*r(85)
        r(174) = PQx*r(129)
        r(219) = PQy*r(165)
        r(218) = PQx*r(165)
        r(129) = 7.d0*r(63) + PQy*r(92)
        r(165) = 7.d0*r(84) + PQz*r(120)
        r(85) = 6.d0*r(36) + PQx*r(57)
        r(173) = r(92) + PQx*r(128)
        r(217) = r(120) + PQy*r(164)
        r(215) = r(120) + PQx*r(163)
        r(128) = PQx*r(92)
        r(216) = PQx*r(164)
        r(164) = PQy*r(120)
        r(163) = PQx*r(120)
        r(92) = 6.d0*r(41) + PQy*r(63)
        r(120) = 6.d0*r(56) + PQz*r(84)
        r(57) = 5.d0*r(21) + PQx*r(36)
        r(172) = 2.d0*r(91) + PQx*r(127)
        r(214) = 2.d0*r(119) + PQy*r(162)
        r(211) = 2.d0*r(118) + PQx*r(160)
        r(127) = r(63) + PQx*r(91)
        r(213) = PQx*r(162)
        r(162) = r(84) + PQy*r(119)
        r(160) = r(84) + PQx*r(118)
        r(91) = PQx*r(63)
        r(212) = r(119) + PQx*r(161)
        r(161) = PQx*r(119)
        r(119) = PQy*r(84)
        r(118) = PQx*r(84)
        r(63) = 5.d0*r(25) + PQy*r(41)
        r(84) = 5.d0*r(35) + PQz*r(56)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(171) = 3.d0*r(90) + PQx*r(126)
        r(210) = 3.d0*r(117) + PQy*r(159)
        r(206) = 3.d0*r(115) + PQx*r(156)
        r(126) = 2.d0*r(62) + PQx*r(90)
        r(209) = PQx*r(159)
        r(159) = 2.d0*r(83) + PQy*r(117)
        r(156) = 2.d0*r(82) + PQx*r(115)
        r(90) = r(41) + PQx*r(62)
        r(208) = r(117) + PQx*r(158)
        r(158) = PQx*r(117)
        r(117) = r(56) + PQy*r(83)
        r(115) = r(56) + PQx*r(82)
        r(62) = PQx*r(41)
        r(207) = 2.d0*r(116) + PQx*r(157)
        r(157) = r(83) + PQx*r(116)
        r(116) = PQx*r(83)
        r(83) = PQy*r(56)
        r(82) = PQx*r(56)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(170) = 4.d0*r(89) + PQx*r(125)
        r(205) = 4.d0*r(114) + PQy*r(155)
        r(200) = 4.d0*r(111) + PQx*r(151)
        r(125) = 3.d0*r(61) + PQx*r(89)
        r(204) = PQx*r(155)
        r(155) = 3.d0*r(81) + PQy*r(114)
        r(151) = 3.d0*r(79) + PQx*r(111)
        r(89) = 2.d0*r(40) + PQx*r(61)
        r(203) = r(114) + PQx*r(154)
        r(154) = PQx*r(114)
        r(114) = 2.d0*r(55) + PQy*r(81)
        r(111) = 2.d0*r(54) + PQx*r(79)
        r(61) = r(25) + PQx*r(40)
        r(202) = 2.d0*r(113) + PQx*r(153)
        r(153) = r(81) + PQx*r(113)
        r(113) = PQx*r(81)
        r(81) = r(35) + PQy*r(55)
        r(79) = r(35) + PQx*r(54)
        r(40) = PQx*r(25)
        r(201) = 3.d0*r(112) + PQx*r(152)
        r(152) = 2.d0*r(80) + PQx*r(112)
        r(112) = r(55) + PQx*r(80)
        r(80) = PQx*r(55)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(169) = 5.d0*r(88) + PQx*r(124)
        r(199) = 5.d0*r(110) + PQy*r(150)
        r(193) = 5.d0*r(106) + PQx*r(145)
        r(124) = 4.d0*r(60) + PQx*r(88)
        r(198) = PQx*r(150)
        r(150) = 4.d0*r(78) + PQy*r(110)
        r(145) = 4.d0*r(75) + PQx*r(106)
        r(88) = 3.d0*r(39) + PQx*r(60)
        r(197) = r(110) + PQx*r(149)
        r(149) = PQx*r(110)
        r(110) = 3.d0*r(53) + PQy*r(78)
        r(106) = 3.d0*r(51) + PQx*r(75)
        r(60) = 2.d0*r(24) + PQx*r(39)
        r(196) = 2.d0*r(109) + PQx*r(148)
        r(148) = r(78) + PQx*r(109)
        r(109) = PQx*r(78)
        r(78) = 2.d0*r(34) + PQy*r(53)
        r(75) = 2.d0*r(33) + PQx*r(51)
        r(39) = r(14) + PQx*r(24)
        r(195) = 3.d0*r(108) + PQx*r(147)
        r(147) = 2.d0*r(77) + PQx*r(108)
        r(108) = r(53) + PQx*r(77)
        r(77) = PQx*r(53)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(194) = 4.d0*r(107) + PQx*r(146)
        r(146) = 3.d0*r(76) + PQx*r(107)
        r(107) = 2.d0*r(52) + PQx*r(76)
        r(76) = r(34) + PQx*r(52)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(168) = 6.d0*r(87) + PQx*r(123)
        r(192) = 6.d0*r(105) + PQy*r(144)
        r(185) = 6.d0*r(100) + PQx*r(138)
        r(123) = 5.d0*r(59) + PQx*r(87)
        r(191) = PQx*r(144)
        r(144) = 5.d0*r(74) + PQy*r(105)
        r(138) = 5.d0*r(70) + PQx*r(100)
        r(87) = 4.d0*r(38) + PQx*r(59)
        r(190) = r(105) + PQx*r(143)
        r(143) = PQx*r(105)
        r(105) = 4.d0*r(50) + PQy*r(74)
        r(100) = 4.d0*r(47) + PQx*r(70)
        r(59) = 3.d0*r(23) + PQx*r(38)
        r(189) = 2.d0*r(104) + PQx*r(142)
        r(142) = r(74) + PQx*r(104)
        r(104) = PQx*r(74)
        r(74) = 3.d0*r(32) + PQy*r(50)
        r(70) = 3.d0*r(30) + PQx*r(47)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(188) = 3.d0*r(103) + PQx*r(141)
        r(141) = 2.d0*r(73) + PQx*r(103)
        r(103) = r(50) + PQx*r(73)
        r(73) = PQx*r(50)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(187) = 4.d0*r(102) + PQx*r(140)
        r(140) = 3.d0*r(72) + PQx*r(102)
        r(102) = 2.d0*r(49) + PQx*r(72)
        r(72) = r(32) + PQx*r(49)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(186) = 5.d0*r(101) + PQx*r(139)
        r(139) = 4.d0*r(71) + PQx*r(101)
        r(101) = 3.d0*r(48) + PQx*r(71)
        r(71) = 2.d0*r(31) + PQx*r(48)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(167) = 7.d0*r(86) + PQx*r(122)
        r(184) = 7.d0*r(99) + PQy*r(137)
        r(176) = 7.d0*r(93) + PQx*r(130)
        r(122) = 6.d0*r(58) + PQx*r(86)
        r(183) = PQx*r(137)
        r(137) = 6.d0*r(69) + PQy*r(99)
        r(130) = 6.d0*r(64) + PQx*r(93)
        r(86) = 5.d0*r(37) + PQx*r(58)
        r(182) = r(99) + PQx*r(136)
        r(136) = PQx*r(99)
        r(99) = 5.d0*r(46) + PQy*r(69)
        r(93) = 5.d0*r(42) + PQx*r(64)
        r(58) = 4.d0*r(22) + PQx*r(37)
        r(181) = 2.d0*r(98) + PQx*r(135)
        r(135) = r(69) + PQx*r(98)
        r(98) = PQx*r(69)
        r(69) = 4.d0*r(29) + PQy*r(46)
        r(64) = 4.d0*r(26) + PQx*r(42)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(180) = 3.d0*r(97) + PQx*r(134)
        r(134) = 2.d0*r(68) + PQx*r(97)
        r(97) = r(46) + PQx*r(68)
        r(68) = PQx*r(46)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(179) = 4.d0*r(96) + PQx*r(133)
        r(133) = 3.d0*r(67) + PQx*r(96)
        r(96) = 2.d0*r(45) + PQx*r(67)
        r(67) = r(29) + PQx*r(45)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(178) = 5.d0*r(95) + PQx*r(132)
        r(132) = 4.d0*r(66) + PQx*r(95)
        r(95) = 3.d0*r(44) + PQx*r(66)
        r(66) = 2.d0*r(28) + PQx*r(44)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(177) = 6.d0*r(94) + PQx*r(131)
        r(131) = 5.d0*r(65) + PQx*r(94)
        r(94) = 4.d0*r(43) + PQx*r(65)
        r(65) = 3.d0*r(27) + PQx*r(43)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(1)
        r(221) = 9.d0*r(121) + PQx*r(166)
        r(231) = 9.d0*r(129) + PQy*r(175)
        r(286) = 9.d0*r(165) + PQz*r(220)
        r(166) = 8.d0*r(85) + PQx*r(121)
        r(230) = PQx*r(175)
        r(285) = PQy*r(220)
        r(284) = PQx*r(220)
        r(175) = 8.d0*r(92) + PQy*r(129)
        r(220) = 8.d0*r(120) + PQz*r(165)
        r(121) = 7.d0*r(57) + PQx*r(85)
        r(229) = r(129) + PQx*r(174)
        r(283) = r(165) + PQy*r(219)
        r(281) = r(165) + PQx*r(218)
        r(174) = PQx*r(129)
        r(282) = PQx*r(219)
        r(219) = PQy*r(165)
        r(218) = PQx*r(165)
        r(129) = 7.d0*r(63) + PQy*r(92)
        r(165) = 7.d0*r(84) + PQz*r(120)
        r(85) = 6.d0*r(36) + PQx*r(57)
        r(228) = 2.d0*r(128) + PQx*r(173)
        r(280) = 2.d0*r(164) + PQy*r(217)
        r(277) = 2.d0*r(163) + PQx*r(215)
        r(173) = r(92) + PQx*r(128)
        r(279) = PQx*r(217)
        r(217) = r(120) + PQy*r(164)
        r(215) = r(120) + PQx*r(163)
        r(128) = PQx*r(92)
        r(278) = r(164) + PQx*r(216)
        r(216) = PQx*r(164)
        r(164) = PQy*r(120)
        r(163) = PQx*r(120)
        r(92) = 6.d0*r(41) + PQy*r(63)
        r(120) = 6.d0*r(56) + PQz*r(84)
        r(57) = 5.d0*r(21) + PQx*r(36)
        r(227) = 3.d0*r(127) + PQx*r(172)
        r(276) = 3.d0*r(162) + PQy*r(214)
        r(272) = 3.d0*r(160) + PQx*r(211)
        r(172) = 2.d0*r(91) + PQx*r(127)
        r(275) = PQx*r(214)
        r(214) = 2.d0*r(119) + PQy*r(162)
        r(211) = 2.d0*r(118) + PQx*r(160)
        r(127) = r(63) + PQx*r(91)
        r(274) = r(162) + PQx*r(213)
        r(213) = PQx*r(162)
        r(162) = r(84) + PQy*r(119)
        r(160) = r(84) + PQx*r(118)
        r(91) = PQx*r(63)
        r(273) = 2.d0*r(161) + PQx*r(212)
        r(212) = r(119) + PQx*r(161)
        r(161) = PQx*r(119)
        r(119) = PQy*r(84)
        r(118) = PQx*r(84)
        r(63) = 5.d0*r(25) + PQy*r(41)
        r(84) = 5.d0*r(35) + PQz*r(56)
        r(36) = 4.d0*r(11) + PQx*r(21)
        r(226) = 4.d0*r(126) + PQx*r(171)
        r(271) = 4.d0*r(159) + PQy*r(210)
        r(266) = 4.d0*r(156) + PQx*r(206)
        r(171) = 3.d0*r(90) + PQx*r(126)
        r(270) = PQx*r(210)
        r(210) = 3.d0*r(117) + PQy*r(159)
        r(206) = 3.d0*r(115) + PQx*r(156)
        r(126) = 2.d0*r(62) + PQx*r(90)
        r(269) = r(159) + PQx*r(209)
        r(209) = PQx*r(159)
        r(159) = 2.d0*r(83) + PQy*r(117)
        r(156) = 2.d0*r(82) + PQx*r(115)
        r(90) = r(41) + PQx*r(62)
        r(268) = 2.d0*r(158) + PQx*r(208)
        r(208) = r(117) + PQx*r(158)
        r(158) = PQx*r(117)
        r(117) = r(56) + PQy*r(83)
        r(115) = r(56) + PQx*r(82)
        r(62) = PQx*r(41)
        r(267) = 3.d0*r(157) + PQx*r(207)
        r(207) = 2.d0*r(116) + PQx*r(157)
        r(157) = r(83) + PQx*r(116)
        r(116) = PQx*r(83)
        r(83) = PQy*r(56)
        r(82) = PQx*r(56)
        r(41) = 4.d0*r(14) + PQy*r(25)
        r(56) = 4.d0*r(20) + PQz*r(35)
        r(21) = 3.d0*r(5) + PQx*r(11)
        r(225) = 5.d0*r(125) + PQx*r(170)
        r(265) = 5.d0*r(155) + PQy*r(205)
        r(259) = 5.d0*r(151) + PQx*r(200)
        r(170) = 4.d0*r(89) + PQx*r(125)
        r(264) = PQx*r(205)
        r(205) = 4.d0*r(114) + PQy*r(155)
        r(200) = 4.d0*r(111) + PQx*r(151)
        r(125) = 3.d0*r(61) + PQx*r(89)
        r(263) = r(155) + PQx*r(204)
        r(204) = PQx*r(155)
        r(155) = 3.d0*r(81) + PQy*r(114)
        r(151) = 3.d0*r(79) + PQx*r(111)
        r(89) = 2.d0*r(40) + PQx*r(61)
        r(262) = 2.d0*r(154) + PQx*r(203)
        r(203) = r(114) + PQx*r(154)
        r(154) = PQx*r(114)
        r(114) = 2.d0*r(55) + PQy*r(81)
        r(111) = 2.d0*r(54) + PQx*r(79)
        r(61) = r(25) + PQx*r(40)
        r(261) = 3.d0*r(153) + PQx*r(202)
        r(202) = 2.d0*r(113) + PQx*r(153)
        r(153) = r(81) + PQx*r(113)
        r(113) = PQx*r(81)
        r(81) = r(35) + PQy*r(55)
        r(79) = r(35) + PQx*r(54)
        r(40) = PQx*r(25)
        r(260) = 4.d0*r(152) + PQx*r(201)
        r(201) = 3.d0*r(112) + PQx*r(152)
        r(152) = 2.d0*r(80) + PQx*r(112)
        r(112) = r(55) + PQx*r(80)
        r(80) = PQx*r(55)
        r(55) = PQy*r(35)
        r(54) = PQx*r(35)
        r(25) = 3.d0*r(7) + PQy*r(14)
        r(35) = 3.d0*r(10) + PQz*r(20)
        r(11) = 2.d0*r(2) + PQx*r(5)
        r(224) = 6.d0*r(124) + PQx*r(169)
        r(258) = 6.d0*r(150) + PQy*r(199)
        r(251) = 6.d0*r(145) + PQx*r(193)
        r(169) = 5.d0*r(88) + PQx*r(124)
        r(257) = PQx*r(199)
        r(199) = 5.d0*r(110) + PQy*r(150)
        r(193) = 5.d0*r(106) + PQx*r(145)
        r(124) = 4.d0*r(60) + PQx*r(88)
        r(256) = r(150) + PQx*r(198)
        r(198) = PQx*r(150)
        r(150) = 4.d0*r(78) + PQy*r(110)
        r(145) = 4.d0*r(75) + PQx*r(106)
        r(88) = 3.d0*r(39) + PQx*r(60)
        r(255) = 2.d0*r(149) + PQx*r(197)
        r(197) = r(110) + PQx*r(149)
        r(149) = PQx*r(110)
        r(110) = 3.d0*r(53) + PQy*r(78)
        r(106) = 3.d0*r(51) + PQx*r(75)
        r(60) = 2.d0*r(24) + PQx*r(39)
        r(254) = 3.d0*r(148) + PQx*r(196)
        r(196) = 2.d0*r(109) + PQx*r(148)
        r(148) = r(78) + PQx*r(109)
        r(109) = PQx*r(78)
        r(78) = 2.d0*r(34) + PQy*r(53)
        r(75) = 2.d0*r(33) + PQx*r(51)
        r(39) = r(14) + PQx*r(24)
        r(253) = 4.d0*r(147) + PQx*r(195)
        r(195) = 3.d0*r(108) + PQx*r(147)
        r(147) = 2.d0*r(77) + PQx*r(108)
        r(108) = r(53) + PQx*r(77)
        r(77) = PQx*r(53)
        r(53) = r(20) + PQy*r(34)
        r(51) = r(20) + PQx*r(33)
        r(24) = PQx*r(14)
        r(252) = 5.d0*r(146) + PQx*r(194)
        r(194) = 4.d0*r(107) + PQx*r(146)
        r(146) = 3.d0*r(76) + PQx*r(107)
        r(107) = 2.d0*r(52) + PQx*r(76)
        r(76) = r(34) + PQx*r(52)
        r(52) = PQx*r(34)
        r(34) = PQy*r(20)
        r(33) = PQx*r(20)
        r(14) = 2.d0*r(3) + PQy*r(7)
        r(20) = 2.d0*r(4) + PQz*r(10)
        r(5) = r(1) + PQx*r(2)
        r(223) = 7.d0*r(123) + PQx*r(168)
        r(250) = 7.d0*r(144) + PQy*r(192)
        r(242) = 7.d0*r(138) + PQx*r(185)
        r(168) = 6.d0*r(87) + PQx*r(123)
        r(249) = PQx*r(192)
        r(192) = 6.d0*r(105) + PQy*r(144)
        r(185) = 6.d0*r(100) + PQx*r(138)
        r(123) = 5.d0*r(59) + PQx*r(87)
        r(248) = r(144) + PQx*r(191)
        r(191) = PQx*r(144)
        r(144) = 5.d0*r(74) + PQy*r(105)
        r(138) = 5.d0*r(70) + PQx*r(100)
        r(87) = 4.d0*r(38) + PQx*r(59)
        r(247) = 2.d0*r(143) + PQx*r(190)
        r(190) = r(105) + PQx*r(143)
        r(143) = PQx*r(105)
        r(105) = 4.d0*r(50) + PQy*r(74)
        r(100) = 4.d0*r(47) + PQx*r(70)
        r(59) = 3.d0*r(23) + PQx*r(38)
        r(246) = 3.d0*r(142) + PQx*r(189)
        r(189) = 2.d0*r(104) + PQx*r(142)
        r(142) = r(74) + PQx*r(104)
        r(104) = PQx*r(74)
        r(74) = 3.d0*r(32) + PQy*r(50)
        r(70) = 3.d0*r(30) + PQx*r(47)
        r(38) = 2.d0*r(13) + PQx*r(23)
        r(245) = 4.d0*r(141) + PQx*r(188)
        r(188) = 3.d0*r(103) + PQx*r(141)
        r(141) = 2.d0*r(73) + PQx*r(103)
        r(103) = r(50) + PQx*r(73)
        r(73) = PQx*r(50)
        r(50) = 2.d0*r(19) + PQy*r(32)
        r(47) = 2.d0*r(18) + PQx*r(30)
        r(23) = r(7) + PQx*r(13)
        r(244) = 5.d0*r(140) + PQx*r(187)
        r(187) = 4.d0*r(102) + PQx*r(140)
        r(140) = 3.d0*r(72) + PQx*r(102)
        r(102) = 2.d0*r(49) + PQx*r(72)
        r(72) = r(32) + PQx*r(49)
        r(49) = PQx*r(32)
        r(32) = r(10) + PQy*r(19)
        r(30) = r(10) + PQx*r(18)
        r(13) = PQx*r(7)
        r(243) = 6.d0*r(139) + PQx*r(186)
        r(186) = 5.d0*r(101) + PQx*r(139)
        r(139) = 4.d0*r(71) + PQx*r(101)
        r(101) = 3.d0*r(48) + PQx*r(71)
        r(71) = 2.d0*r(31) + PQx*r(48)
        r(48) = r(19) + PQx*r(31)
        r(31) = PQx*r(19)
        r(19) = PQy*r(10)
        r(18) = PQx*r(10)
        r(7) = r(1) + PQy*r(3)
        r(10) = r(1) + PQz*r(4)
        r(2) = PQx*r(1)
        r(222) = 8.d0*r(122) + PQx*r(167)
        r(241) = 8.d0*r(137) + PQy*r(184)
        r(232) = 8.d0*r(130) + PQx*r(176)
        r(167) = 7.d0*r(86) + PQx*r(122)
        r(240) = PQx*r(184)
        r(184) = 7.d0*r(99) + PQy*r(137)
        r(176) = 7.d0*r(93) + PQx*r(130)
        r(122) = 6.d0*r(58) + PQx*r(86)
        r(239) = r(137) + PQx*r(183)
        r(183) = PQx*r(137)
        r(137) = 6.d0*r(69) + PQy*r(99)
        r(130) = 6.d0*r(64) + PQx*r(93)
        r(86) = 5.d0*r(37) + PQx*r(58)
        r(238) = 2.d0*r(136) + PQx*r(182)
        r(182) = r(99) + PQx*r(136)
        r(136) = PQx*r(99)
        r(99) = 5.d0*r(46) + PQy*r(69)
        r(93) = 5.d0*r(42) + PQx*r(64)
        r(58) = 4.d0*r(22) + PQx*r(37)
        r(237) = 3.d0*r(135) + PQx*r(181)
        r(181) = 2.d0*r(98) + PQx*r(135)
        r(135) = r(69) + PQx*r(98)
        r(98) = PQx*r(69)
        r(69) = 4.d0*r(29) + PQy*r(46)
        r(64) = 4.d0*r(26) + PQx*r(42)
        r(37) = 3.d0*r(12) + PQx*r(22)
        r(236) = 4.d0*r(134) + PQx*r(180)
        r(180) = 3.d0*r(97) + PQx*r(134)
        r(134) = 2.d0*r(68) + PQx*r(97)
        r(97) = r(46) + PQx*r(68)
        r(68) = PQx*r(46)
        r(46) = 3.d0*r(17) + PQy*r(29)
        r(42) = 3.d0*r(15) + PQx*r(26)
        r(22) = 2.d0*r(6) + PQx*r(12)
        r(235) = 5.d0*r(133) + PQx*r(179)
        r(179) = 4.d0*r(96) + PQx*r(133)
        r(133) = 3.d0*r(67) + PQx*r(96)
        r(96) = 2.d0*r(45) + PQx*r(67)
        r(67) = r(29) + PQx*r(45)
        r(45) = PQx*r(29)
        r(29) = 2.d0*r(9) + PQy*r(17)
        r(26) = 2.d0*r(8) + PQx*r(15)
        r(12) = r(3) + PQx*r(6)
        r(234) = 6.d0*r(132) + PQx*r(178)
        r(178) = 5.d0*r(95) + PQx*r(132)
        r(132) = 4.d0*r(66) + PQx*r(95)
        r(95) = 3.d0*r(44) + PQx*r(66)
        r(66) = 2.d0*r(28) + PQx*r(44)
        r(44) = r(17) + PQx*r(28)
        r(28) = PQx*r(17)
        r(17) = r(4) + PQy*r(9)
        r(15) = r(4) + PQx*r(8)
        r(6) = PQx*r(3)
        r(233) = 7.d0*r(131) + PQx*r(177)
        r(177) = 6.d0*r(94) + PQx*r(131)
        r(131) = 5.d0*r(65) + PQx*r(94)
        r(94) = 4.d0*r(43) + PQx*r(65)
        r(65) = 3.d0*r(27) + PQx*r(43)
        r(43) = 2.d0*r(16) + PQx*r(27)
        r(27) = r(9) + PQx*r(16)
        r(16) = PQx*r(9)
        r(9) = PQy*r(4)
        r(8) = PQx*r(4)
        r(3) = PQy*r(1)
        r(4) = PQz*r(1)
        r(1) = AuxR(0)
      END SUBROUTINE AuxInt10
