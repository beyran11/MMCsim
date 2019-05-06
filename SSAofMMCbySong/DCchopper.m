function DCchopper

% clc
% clear all
% close all
% 
% 

D = 0.5 ;
s = 0 ;
for n=1:200
    s = s + (1 - cos(2*pi*n*D))/(n*pi)^2 ;
    Svec(n) = s ;
end
s

D*(1-D)

plot(1:n,Svec)
hold on
plot(1:n,D*(1-D)*ones(1,n))
ylim([0.2 0.26])