% function Harm2
clc
clear all
close all

global nH 
nH = 50 ;

D = 0.5 ;
Vin = 0.85 ;

T = 2*pi;
Fs = 2;
dt = 1/(1000*Fs);

t = 0:dt:2*T-dt ;


a0out = D*Vin ;
a0 = (1-D)*Vin ;

Saout = 0 ;
Sbout = 0 ;

Sa = 0 ;
Sb = 0 ;
Sc = 0 ;


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


% plot(t,v_out)
hold on
plot(t,v_SW,'k','linewidth',2)
% plot(t,v_SW.*v_out)
% ylim([-10 110])
xlabel('time [s]')
ylabel('v_M(t) and i(t)')

fun = @DprimCalc;

x0 = D ;
Dp= fsolve(fun,x0)



Nsw = 10 ;
for k = 1:Nsw
    x = (sawtooth(2*pi*Fs*t,0.5)+1)/2/Nsw+(k-1)/Nsw;
    plot(t,x)
end

box on

xlabel('time (s)')
ylabel('Vref')
title(['Level-Shift Modulation, n=',num2str(nH),', D=',num2str(D),...
    ', N_{sw}=',num2str(Nsw),', f_{sw}=',num2str(Fs)])
