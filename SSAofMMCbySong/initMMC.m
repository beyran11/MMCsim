% function initMMC

clc
clear all
close all
P = 300e6 ;
Q = 0 ;
S_VA = 300e6 ;
VL = 150e3 ;

phi = acos(P/S_VA) ;

M = 1 ;
N = 10 ;
w1 = 2*pi*50 ;
Ia = S_VA/(sqrt(3)*VL) ;
Lc = 56e-6 ;
Cd = 800e-6 ;

Ud = 300e3 ;
Id = P/Ud ;
Iad = Id/3 
Iadp = M*cos(phi)*Ia/2*sqrt(2)
Ibd = Id/3 ;
Icd = Id/3 ;


A = 3*sqrt(2)/64 * M*N*Ia/(w1^2*Cd*Lc) ;
B = - N/16 * M^2*Iad / (w1^2*Cd*Lc) ; 

Theta = atan2(A*cos(phi)+B,-A*sin(phi)) ;
Iaz = sqrt((A*cos(phi)+B)^2 + (A*sin(phi))^2)/(1-N/(16*w1^2*Cd*Lc)-M^2*N/(24*w1^2*Cd*Lc)) ;

t = [0:0.1:20]*1e-3 ;

%%
iAP = sqrt(2)/2*Ia*sin(w1*t+phi) + Iad + Iaz* sin(2*w1*t+Theta) ;
iAN = -sqrt(2)/2*Ia*sin(w1*t+phi) + Iad + Iaz* sin(2*w1*t+Theta) ;

%% Capacitor Side
%% DC component
iCPdc = 1/2*Iad - sqrt(2)/8 * M* Ia * cos(phi)
iCNdc = 1/2*Iad - sqrt(2)/8 * M* Ia * cos(phi)

%% fundamental component
iCPh1 = -1/2*M*Iad*sin(w1*t) + sqrt(2)/4 * Ia*sin(w1*t+phi) - 1/4 *M* Iaz*cos(w1*t+Theta) ;
iCNh1 = 1/2*M*Iad*sin(w1*t) - sqrt(2)/4 * Ia*sin(w1*t+phi) + 1/4 *M* Iaz*cos(w1*t+Theta) ;

%% 2nd component
iCPh2 =  sqrt(2)/8*M * Ia*cos(2*w1*t+phi) + 1/2 * Iaz* sin(2*w1*t+Theta) ;
iCNh2 =  sqrt(2)/8*M * Ia*cos(2*w1*t+phi) + 1/2 * Iaz* sin(2*w1*t+Theta) ;

%% 3nd component
iCPh3 =   1/4 * M * Iaz* cos(3*w1*t+Theta) ;
iCNh3 =  - 1/4 * M * Iaz* cos(3*w1*t+Theta) ;


%% Ripple voltages accross the phase 

dUph1 = -sqrt(2)*M*N*Ia*sin(phi)/(8*w1*Cd) + M^2*N*Iaz*sin(Theta)/(8*w1*Cd) - ...
    M^2*N*Iad*sin(2*w1*t)/(4*w1*Cd) + sqrt(2)*M*N*Ia*sin(2*w1*t+phi)/(8*w1*Cd) - ...
    M^2*N*Iad*sin(2*w1*t+Theta)/(8*w1*Cd) ;

dUph2 = sqrt(2)*M*N*Iad*sin(2*w1*t+phi)/(16*w1*Cd) - N*Iaz*cos(2*w1*t+Theta)/(4*w1*Cd) ;
dUph3 = -M^2*N*Iaz*cos(2*w1*t+Theta)/(24*w1*Cd) + M^2* N*Iaz*cos(4*w1*t+Theta)/(24*w1*Cd) ;

%% Switching Funvtion
Sap_avg = 1/2 - 1/2*M*sin(w1*t) ;
San_avg = 1/2 + 1/2*M*sin(w1*t) ;


% plot(t,iCPdc*ones(1,length(t)))
hold on
% % plot(t,iCPh1)
% plot(t,iCPh2)
% plot(t,iCPh3)
% plot(t,iCPdc+iCPh1+iCPh2+iCPh3)
% plot(t,iCNdc+iCNh1+iCNh2+iCNh3)

% plot(t,iAP)
% plot(t,iAN)

% plot(t,dUph1)
% plot(t,dUph2)
% plot(t,dUph3)

plot(t,Sap_avg)
plot(t,San_avg)
