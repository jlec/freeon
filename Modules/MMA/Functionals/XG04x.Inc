        UTmp(1)=R**(4.D0/3.D0)
        UTmp(2)=sqrt(A)
        UTmp(3)=1/UTmp(1)
        UTmp(4)=1.D0*UTmp(2)*UTmp(3)
        UTmp(5)=asinh(UTmp(4))
        UTmp(6)=2.52D-2*UTmp(2)*UTmp(3)*UTmp(5)
        UTmp(7)=1.D0+UTmp(6)
        UTmp(8)=1/UTmp(7)
        UTmp(9)=R**(8.D0/3.D0)
        UTmp(10)=1/UTmp(9)
        UTmp(11)=4.51357747124611D-3*A*UTmp(10)
        UTmp(12)=1.D0+UTmp(6)+UTmp(11)
        UTmp(13)=UTmp(8)*UTmp(12)
        UTmp(14)=-1.D0+UTmp(13)
        !UTmp(15)=7.65D-1*UTmp(14)
        UTmp(15)=Ax1*UTmp(14)
        UTmp(16)=A**2
        UTmp(17)=R**(1.6D1/3.D0)
        UTmp(18)=1/UTmp(17)
        UTmp(19)=1.08310862522922D-6*UTmp(16)*UTmp(18)
        UTmp(20)=1.00000587778078D0*UTmp(2)*UTmp(3)
        UTmp(21)=asinh(UTmp(20))
        UTmp(22)=2.52002610049301D-2*UTmp(2)*UTmp(3)*UTmp(21)
        UTmp(23)=1.D0+UTmp(19)+UTmp(22)
        UTmp(24)=1/UTmp(23)
        UTmp(25)=-1.64553078460206D0*A*UTmp(10)
        UTmp(26)=exp(UTmp(25))
        UTmp(27)=-1.508D-1*UTmp(26)
        UTmp(28)=2.743D-1+UTmp(27)
        UTmp(29)=1.64553078460206D-2*A*UTmp(10)*UTmp(28)
        UTmp(30)=1.D0+UTmp(22)+UTmp(29)
        UTmp(31)=UTmp(24)*UTmp(30)
        UTmp(32)=-1.D0+UTmp(31)
        !UTmp(33)=2.35D-1*UTmp(32)
        UTmp(33)=Ax2*UTmp(32)
        UTmp(34)=1.D0+UTmp(15)+UTmp(33)
        UTmp(35)=R**(1.1D1/3.D0)
        UTmp(36)=1/UTmp(35)
        UTmp(37)=1.D0*A*UTmp(10)
        UTmp(38)=1.D0+UTmp(37)
        UTmp(39)=sqrt(UTmp(38))
        UTmp(40)=1/UTmp(39)
        UTmp(41)=-1.68D-2*A*UTmp(36)*UTmp(40)
        UTmp(42)=R**(7.D0/3.D0)
        UTmp(43)=1/UTmp(42)
        UTmp(44)=-1.68D-2*UTmp(2)*UTmp(5)*UTmp(43)
        UTmp(45)=UTmp(7)**2
        UTmp(46)=1/UTmp(45)
        UTmp(47)=R**(1.9D1/3.D0)
        UTmp(48)=1/UTmp(47)
        UTmp(49)=1.0000117555961D0*A*UTmp(10)
        UTmp(50)=1.D0+UTmp(49)
        UTmp(51)=sqrt(UTmp(50))
        UTmp(52)=1/UTmp(51)
        UTmp(53)=-1.68002727510265D-2*A*UTmp(36)*UTmp(52)
        UTmp(54)=-1.68001740032868D-2*UTmp(2)*UTmp(21)*UTmp(43)
        UTmp(55)=UTmp(23)**2
        UTmp(56)=1/UTmp(55)
        UTmp(57)=3.15D-3*UTmp(10)*UTmp(40)
        UTmp(58)=1/UTmp(2)
        UTmp(59)=3.15D-3*UTmp(3)*UTmp(5)*UTmp(58)
        UTmp(60)=3.15005114081748D-3*UTmp(10)*UTmp(52)
        UTmp(61)=3.15003262561627D-3*UTmp(3)*UTmp(21)*UTmp(58)
        UTmp(62)=6.3D-3*UTmp(10)*UTmp(40)
        UTmp(63)=6.3D-3*UTmp(3)*UTmp(5)*UTmp(58)
        UTmp(64)=6.30010228163496D-3*UTmp(10)*UTmp(52)
        UTmp(65)=6.30006525123254D-3*UTmp(3)*UTmp(21)*UTmp(58)
        Ei=-1.8610514726982D0*UTmp(1)*UTmp(34)
        VTmp(1)=-1.2407009817988D0*R**(1.D0/3.D0)*UTmp(34)
        VTmp(2)=UTmp(1)
        VTmp(3)=UTmp(8)*(-6.01810329499482D-3*A*UTmp(36)+UTmp(41)+UTmp(44))
        VTmp(4)=-(UTmp(12)*(UTmp(41)+UTmp(44))*UTmp(46))
        VTmp(5)=UTmp(24)
        VTmp(6)=-2.19404104613607D-2*A*UTmp(28)*UTmp(36)
        VTmp(7)=-5.44442602281889D-3*UTmp(16)*UTmp(26)*UTmp(48)
        VTmp(8)=UTmp(53)+UTmp(54)
        VTmp(9)=-UTmp(30)
        VTmp(10)=(-2.88828966727793D-6*UTmp(16)*UTmp(48)+UTmp(53)+UTmp(54))*UTmp(56)
        VTmp(11)=VTmp(5)*(VTmp(6)+VTmp(7)+VTmp(8))+VTmp(9)*VTmp(10)
        VTmp(12)=VTmp(2)
        !VTmp(13)=7.65D-1*(VTmp(3)+VTmp(4))+2.35D-1*VTmp(11)
        VTmp(13)=Ax1*(VTmp(3)+VTmp(4))+Ax2*VTmp(11)
        dEdRhoi=VTmp(1)-1.8610514726982D0*VTmp(12)*VTmp(13)
        VTmp(1)=UTmp(1)
        VTmp(2)=-(UTmp(12)*UTmp(46)*(UTmp(57)+UTmp(59)))
        VTmp(3)=UTmp(8)*(1.12839436781153D-3*UTmp(10)+UTmp(57)+UTmp(59))
        VTmp(4)=-UTmp(30)
        VTmp(5)=UTmp(56)*(5.41554312614611D-7*A*UTmp(18)+UTmp(60)+UTmp(61))
        VTmp(6)=UTmp(24)
        VTmp(7)=1.02082987927854D-3*A*UTmp(18)*UTmp(26)
        VTmp(8)=4.11382696150514D-3*UTmp(10)*UTmp(28)
        VTmp(9)=UTmp(60)+UTmp(61)
        VTmp(10)=VTmp(4)*VTmp(5)+VTmp(6)*(VTmp(7)+VTmp(8)+VTmp(9))
        VTmp(11)=VTmp(1)
        !VTmp(12)=7.65D-1*(VTmp(2)+VTmp(3))+2.35D-1*VTmp(10)
        VTmp(12)=Ax1*(VTmp(2)+VTmp(3))+Ax2*VTmp(10)
        VTmp(13)=UTmp(1)
        VTmp(14)=-(UTmp(12)*UTmp(46)*(UTmp(62)+UTmp(63)))
        VTmp(15)=UTmp(8)*(2.25678873562306D-3*UTmp(10)+UTmp(62)+UTmp(63))
        VTmp(16)=-UTmp(30)
        VTmp(17)=UTmp(56)*(1.08310862522922D-6*A*UTmp(18)+UTmp(64)+UTmp(65))
        VTmp(18)=UTmp(24)
        VTmp(19)=2.04165975855709D-3*A*UTmp(18)*UTmp(26)
        VTmp(20)=8.22765392301028D-3*UTmp(10)*UTmp(28)
        VTmp(21)=UTmp(64)+UTmp(65)
        VTmp(22)=VTmp(16)*VTmp(17)+VTmp(18)*(VTmp(19)+VTmp(20)+VTmp(21))
        VTmp(23)=VTmp(13)
        !VTmp(24)=7.65D-1*(VTmp(14)+VTmp(15))+2.35D-1*VTmp(22)
        VTmp(24)=Ax1*(VTmp(14)+VTmp(15))+Ax2*VTmp(22)
        VTmp(25)=-3.7221029453964D0*VTmp(11)*VTmp(12)
        VTmp(26)=-1.8610514726982D0*VTmp(23)*VTmp(24)
        dEdGami=VTmp(25)+VTmp(26)
