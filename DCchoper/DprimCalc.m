function F = DprimCalc(x)


D = x ;
FD = 0 ;
global nH 
for n = 1:nH
    FD = FD + (1-cos(2*n*pi*D))/(n*pi)^2 ;
end

F = x*(1-x)-FD ;

