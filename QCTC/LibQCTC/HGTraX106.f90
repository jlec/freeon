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
      SUBROUTINE HGTraX106(PQx,PQy,PQz,Q)
        USE ERIGlobals
        USE PoleNodeType
        TYPE(PoleNode) :: Q
        REAL(DOUBLE) :: PQx,PQy,PQz
        W(1) = Q%Co(1)*r(1) + Q%Co(2)*r(2) + Q%Co(3)*r(3) + Q%Co(4)*r(4) + Q%Co(5)*r(5)
        W(2) = Q%Co(6)*r(6) + Q%Co(7)*r(7) + Q%Co(8)*r(8) + Q%Co(9)*r(9) + Q%Co(10)*r(10)
        W(3) = Q%Co(11)*r(11) + Q%Co(12)*r(12) + Q%Co(13)*r(13) + Q%Co(14)*r(14) + Q%Co(15)*r(15)
        W(4) = Q%Co(16)*r(16) + Q%Co(17)*r(17) + Q%Co(18)*r(18)
        W(5) = Q%Co(19)*r(19) + Q%Co(20)*r(20) + Q%Co(21)*r(21)
        W(6) = Q%Co(22)*r(22) + Q%Co(23)*r(23) + Q%Co(24)*r(24) + Q%Co(25)*r(25) + Q%Co(26)*r(26)
        W(7) = Q%Co(27)*r(27) + Q%Co(28)*r(28) + Q%Co(29)*r(29) + Q%Co(30)*r(30) + Q%Co(31)*r(31)
        W(8) = Q%Co(32)*r(32) + Q%Co(33)*r(33) + Q%Co(34)*r(34) + Q%Co(35)*r(35) + Q%Co(36)*r(36)
        W(9) = Q%Co(37)*r(37) + Q%Co(38)*r(38) + Q%Co(39)*r(39)
        W(10) = Q%Co(40)*r(40) + Q%Co(41)*r(41) + Q%Co(42)*r(42)
        W(11) = Q%Co(43)*r(43) + Q%Co(44)*r(44) + Q%Co(45)*r(45) + Q%Co(46)*r(46) + Q%Co(47)*r(47)
        W(12) = Q%Co(48)*r(48) + Q%Co(49)*r(49) + Q%Co(50)*r(50) + Q%Co(51)*r(51) + Q%Co(52)*r(52)
        W(13) = Q%Co(53)*r(53) + Q%Co(54)*r(54) + Q%Co(55)*r(55) + Q%Co(56)*r(56) + Q%Co(57)*r(57)
        W(14) = Q%Co(58)*r(58) + Q%Co(59)*r(59) + Q%Co(60)*r(60)
        W(15) = Q%Co(61)*r(61) + Q%Co(62)*r(62) + Q%Co(63)*r(63)
        W(16) = Q%Co(64)*r(64) + Q%Co(65)*r(65) + Q%Co(66)*r(66) + Q%Co(67)*r(67) + Q%Co(68)*r(68)
        W(17) = Q%Co(69)*r(69) + Q%Co(70)*r(70) + Q%Co(71)*r(71) + Q%Co(72)*r(72) + Q%Co(73)*r(73)
        W(18) = Q%Co(74)*r(74) + Q%Co(75)*r(75) + Q%Co(76)*r(76) + Q%Co(77)*r(77) + Q%Co(78)*r(78)
        W(19) = Q%Co(79)*r(79) + Q%Co(80)*r(80) + Q%Co(81)*r(81)
        W(20) = Q%Co(82)*r(82) + Q%Co(83)*r(83) + Q%Co(84)*r(84)
        W(21) = W(1) + W(2) + W(3) + W(4) + W(5) + W(6) + W(7) + W(8) + W(9) + W(10)
        W(22) = W(11) + W(12) + W(13) + W(14) + W(15) + W(16) + W(17) + W(18) + W(19) + W(20)
        HGKet(1)=HGKet(1) + W(21) + W(22)
        W(1) = Q%Co(1)*r(2) + Q%Co(2)*r(5) + Q%Co(3)*r(6) + Q%Co(4)*r(8) + Q%Co(5)*r(11)
        W(2) = Q%Co(6)*r(12) + Q%Co(7)*r(13) + Q%Co(8)*r(15) + Q%Co(9)*r(16) + Q%Co(10)*r(18)
        W(3) = Q%Co(11)*r(21) + Q%Co(12)*r(22) + Q%Co(13)*r(23) + Q%Co(14)*r(24) + Q%Co(15)*r(26)
        W(4) = Q%Co(16)*r(27) + Q%Co(17)*r(28) + Q%Co(18)*r(30)
        W(5) = Q%Co(19)*r(31) + Q%Co(20)*r(33) + Q%Co(21)*r(36)
        W(6) = Q%Co(22)*r(37) + Q%Co(23)*r(38) + Q%Co(24)*r(39) + Q%Co(25)*r(40) + Q%Co(26)*r(42)
        W(7) = Q%Co(27)*r(43) + Q%Co(28)*r(44) + Q%Co(29)*r(45) + Q%Co(30)*r(47) + Q%Co(31)*r(48)
        W(8) = Q%Co(32)*r(49) + Q%Co(33)*r(51) + Q%Co(34)*r(52) + Q%Co(35)*r(54) + Q%Co(36)*r(57)
        W(9) = Q%Co(37)*r(58) + Q%Co(38)*r(59) + Q%Co(39)*r(60)
        W(10) = Q%Co(40)*r(61) + Q%Co(41)*r(62) + Q%Co(42)*r(64)
        W(11) = Q%Co(43)*r(65) + Q%Co(44)*r(66) + Q%Co(45)*r(67) + Q%Co(46)*r(68) + Q%Co(47)*r(70)
        W(12) = Q%Co(48)*r(71) + Q%Co(49)*r(72) + Q%Co(50)*r(73) + Q%Co(51)*r(75) + Q%Co(52)*r(76)
        W(13) = Q%Co(53)*r(77) + Q%Co(54)*r(79) + Q%Co(55)*r(80) + Q%Co(56)*r(82) + Q%Co(57)*r(85)
        W(14) = Q%Co(58)*r(86) + Q%Co(59)*r(87) + Q%Co(60)*r(88)
        W(15) = Q%Co(61)*r(89) + Q%Co(62)*r(90) + Q%Co(63)*r(91)
        W(16) = Q%Co(64)*r(93) + Q%Co(65)*r(94) + Q%Co(66)*r(95) + Q%Co(67)*r(96) + Q%Co(68)*r(97)
        W(17) = Q%Co(69)*r(98) + Q%Co(70)*r(100) + Q%Co(71)*r(101) + Q%Co(72)*r(102) + Q%Co(73)*r(103)
        W(18) = Q%Co(74)*r(104) + Q%Co(75)*r(106) + Q%Co(76)*r(107) + Q%Co(77)*r(108) + Q%Co(78)*r(109)
        W(19) = Q%Co(79)*r(111) + Q%Co(80)*r(112) + Q%Co(81)*r(113)
        W(20) = Q%Co(82)*r(115) + Q%Co(83)*r(116) + Q%Co(84)*r(118)
        W(21) = W(1) + W(2) + W(3) + W(4) + W(5) + W(6) + W(7) + W(8) + W(9) + W(10)
        W(22) = W(11) + W(12) + W(13) + W(14) + W(15) + W(16) + W(17) + W(18) + W(19) + W(20)
        HGKet(2)=HGKet(2) + W(21) + W(22)
        W(1) = Q%Co(1)*r(3) + Q%Co(2)*r(6) + Q%Co(3)*r(7) + Q%Co(4)*r(9) + Q%Co(5)*r(12)
        W(2) = Q%Co(6)*r(13) + Q%Co(7)*r(14) + Q%Co(8)*r(16) + Q%Co(9)*r(17) + Q%Co(10)*r(19)
        W(3) = Q%Co(11)*r(22) + Q%Co(12)*r(23) + Q%Co(13)*r(24) + Q%Co(14)*r(25) + Q%Co(15)*r(27)
        W(4) = Q%Co(16)*r(28) + Q%Co(17)*r(29) + Q%Co(18)*r(31)
        W(5) = Q%Co(19)*r(32) + Q%Co(20)*r(34) + Q%Co(21)*r(37)
        W(6) = Q%Co(22)*r(38) + Q%Co(23)*r(39) + Q%Co(24)*r(40) + Q%Co(25)*r(41) + Q%Co(26)*r(43)
        W(7) = Q%Co(27)*r(44) + Q%Co(28)*r(45) + Q%Co(29)*r(46) + Q%Co(30)*r(48) + Q%Co(31)*r(49)
        W(8) = Q%Co(32)*r(50) + Q%Co(33)*r(52) + Q%Co(34)*r(53) + Q%Co(35)*r(55) + Q%Co(36)*r(58)
        W(9) = Q%Co(37)*r(59) + Q%Co(38)*r(60) + Q%Co(39)*r(61)
        W(10) = Q%Co(40)*r(62) + Q%Co(41)*r(63) + Q%Co(42)*r(65)
        W(11) = Q%Co(43)*r(66) + Q%Co(44)*r(67) + Q%Co(45)*r(68) + Q%Co(46)*r(69) + Q%Co(47)*r(71)
        W(12) = Q%Co(48)*r(72) + Q%Co(49)*r(73) + Q%Co(50)*r(74) + Q%Co(51)*r(76) + Q%Co(52)*r(77)
        W(13) = Q%Co(53)*r(78) + Q%Co(54)*r(80) + Q%Co(55)*r(81) + Q%Co(56)*r(83) + Q%Co(57)*r(86)
        W(14) = Q%Co(58)*r(87) + Q%Co(59)*r(88) + Q%Co(60)*r(89)
        W(15) = Q%Co(61)*r(90) + Q%Co(62)*r(91) + Q%Co(63)*r(92)
        W(16) = Q%Co(64)*r(94) + Q%Co(65)*r(95) + Q%Co(66)*r(96) + Q%Co(67)*r(97) + Q%Co(68)*r(98)
        W(17) = Q%Co(69)*r(99) + Q%Co(70)*r(101) + Q%Co(71)*r(102) + Q%Co(72)*r(103) + Q%Co(73)*r(104)
        W(18) = Q%Co(74)*r(105) + Q%Co(75)*r(107) + Q%Co(76)*r(108) + Q%Co(77)*r(109) + Q%Co(78)*r(110)
        W(19) = Q%Co(79)*r(112) + Q%Co(80)*r(113) + Q%Co(81)*r(114)
        W(20) = Q%Co(82)*r(116) + Q%Co(83)*r(117) + Q%Co(84)*r(119)
        W(21) = W(1) + W(2) + W(3) + W(4) + W(5) + W(6) + W(7) + W(8) + W(9) + W(10)
        W(22) = W(11) + W(12) + W(13) + W(14) + W(15) + W(16) + W(17) + W(18) + W(19) + W(20)
        HGKet(3)=HGKet(3) + W(21) + W(22)
        W(1) = Q%Co(1)*r(4) + Q%Co(2)*r(8) + Q%Co(3)*r(9) + Q%Co(4)*r(10) + Q%Co(5)*r(15)
        W(2) = Q%Co(6)*r(16) + Q%Co(7)*r(17) + Q%Co(8)*r(18) + Q%Co(9)*r(19) + Q%Co(10)*r(20)
        W(3) = Q%Co(11)*r(26) + Q%Co(12)*r(27) + Q%Co(13)*r(28) + Q%Co(14)*r(29) + Q%Co(15)*r(30)
        W(4) = Q%Co(16)*r(31) + Q%Co(17)*r(32) + Q%Co(18)*r(33)
        W(5) = Q%Co(19)*r(34) + Q%Co(20)*r(35) + Q%Co(21)*r(42)
        W(6) = Q%Co(22)*r(43) + Q%Co(23)*r(44) + Q%Co(24)*r(45) + Q%Co(25)*r(46) + Q%Co(26)*r(47)
        W(7) = Q%Co(27)*r(48) + Q%Co(28)*r(49) + Q%Co(29)*r(50) + Q%Co(30)*r(51) + Q%Co(31)*r(52)
        W(8) = Q%Co(32)*r(53) + Q%Co(33)*r(54) + Q%Co(34)*r(55) + Q%Co(35)*r(56) + Q%Co(36)*r(64)
        W(9) = Q%Co(37)*r(65) + Q%Co(38)*r(66) + Q%Co(39)*r(67)
        W(10) = Q%Co(40)*r(68) + Q%Co(41)*r(69) + Q%Co(42)*r(70)
        W(11) = Q%Co(43)*r(71) + Q%Co(44)*r(72) + Q%Co(45)*r(73) + Q%Co(46)*r(74) + Q%Co(47)*r(75)
        W(12) = Q%Co(48)*r(76) + Q%Co(49)*r(77) + Q%Co(50)*r(78) + Q%Co(51)*r(79) + Q%Co(52)*r(80)
        W(13) = Q%Co(53)*r(81) + Q%Co(54)*r(82) + Q%Co(55)*r(83) + Q%Co(56)*r(84) + Q%Co(57)*r(93)
        W(14) = Q%Co(58)*r(94) + Q%Co(59)*r(95) + Q%Co(60)*r(96)
        W(15) = Q%Co(61)*r(97) + Q%Co(62)*r(98) + Q%Co(63)*r(99)
        W(16) = Q%Co(64)*r(100) + Q%Co(65)*r(101) + Q%Co(66)*r(102) + Q%Co(67)*r(103) + Q%Co(68)*r(104)
        W(17) = Q%Co(69)*r(105) + Q%Co(70)*r(106) + Q%Co(71)*r(107) + Q%Co(72)*r(108) + Q%Co(73)*r(109)
        W(18) = Q%Co(74)*r(110) + Q%Co(75)*r(111) + Q%Co(76)*r(112) + Q%Co(77)*r(113) + Q%Co(78)*r(114)
        W(19) = Q%Co(79)*r(115) + Q%Co(80)*r(116) + Q%Co(81)*r(117)
        W(20) = Q%Co(82)*r(118) + Q%Co(83)*r(119) + Q%Co(84)*r(120)
        W(21) = W(1) + W(2) + W(3) + W(4) + W(5) + W(6) + W(7) + W(8) + W(9) + W(10)
        W(22) = W(11) + W(12) + W(13) + W(14) + W(15) + W(16) + W(17) + W(18) + W(19) + W(20)
        HGKet(4)=HGKet(4) + W(21) + W(22)
      END SUBROUTINE HGTraX106
