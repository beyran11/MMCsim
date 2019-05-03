% function Harm2
clc
clear all
close all

D = 0.750 ;
Vin = 100 ;
t = 0:0.01:2*pi ;


a0out = D*Vin ;
a0 = (1-D)*Vin ;

Saout = 0 ;
Sbout = 0 ;

Sa = 0 ;
Sb = 0 ;
Sc = 0 ;

nH = 5000 ;
for n = 1:nH
    
    aout(n) = 1/(n*pi)*Vin*sin(2*pi*n*D) ;    
    bout(n) = 1/(n*pi)*Vin*(1-cos(2*pi*n*D)) ;
    cout(n) = sqrt(aout(n)^2 +bout(n)^2) ;
    
    Saout = Saout + aout(n)*cos(n*t) ;
    Sbout = Sbout + bout(n)*sin(n*t) ;
    
    
    a(n) = -1/(n*pi)*Vin*sin(2*pi*n*D) ;
    b(n) = -1/(n*pi)*Vin*(1-cos(2*pi*n*D)) ;
    c(n) = sqrt(a(n)^2 +b(n)^2) ;
    
    Sa = Sa + a(n)*cos(n*t) ;
    Sb = Sb + b(n)*sin(n*t) ;
    Sc = Sc + c(n)*cos(n*t-n*pi*D) ;
end

v_out = a0out + Saout + Sbout ;
v_SW = a0 + Sa + Sb ;


plot(t,v_out)
hold on 
plot(t,v_SW)
plot(t,v_SW.*v_out)
ylim([-10 110])
