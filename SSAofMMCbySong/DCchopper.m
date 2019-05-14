function DCchopper

% clc
% clear all
% close all
%
%
for i=1:5
    D = 0.1*i ;
    s = 0 ;
    for n=1:50
        s = s + (1 - cos(2*pi*n*D))/(n*pi)^2 ;
        Svec(n) = s ;
    end
    s
    
    D*(1-D)
    
    plot(1:n,Svec,'k','linewidth',1)
    hold on
    plot(1:n,D*(1-D)*ones(1,n),'--b')
end

xlim([1 50])
ylim([0.0 0.26])

xlabel('Harmonic Order')
ylabel('D(1-D)')

1+1




