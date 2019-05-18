% function DCchopper

clc
clear all
close all
%
%
V = 1 ;
R = 1 ;
for i=1:5
    D = 0.1*i ;
    s = 0 ;
    for n=1:50
        s = s + (1 - cos(2*pi*n*D))/(n*pi)^2 ;
        Svec(n) = s ;
    end
    s
    
    D*(1-D)
    
    plot(1:n,D*(1-D)-Svec,'linewidth',1,'DisplayName',['D=',num2str(D)])
    hold on

end

xlim([1 50])
a = gca;
a.TickLabelInterpreter = 'latex';
a.Box = 'on';
a.BoxStyle = 'full';

ylim([-0.01 0.1])

xlabel('Harmonic Order','Interpreter','latex')
ylabel('$$ P_{SW} $$','Interpreter','latex')
str = '$$ \ P_{SW}=\frac{V^2}{R_L}D(1-D)-\frac{V^2}{R_L}\sum_{n=1}^{\infty}\frac{2sin^2(n{\pi}D)}{(n{\pi})^2} $$' ;
% str = '$$ \int_{0}^{2} x^2\sin(x) dx $$';

tx = text(15,0.05,str,'Interpreter','latex')
tx.FontSize = 10 ;
% tx.FontName = 'Times' ;
% xlabel('x','Interpreter','latex');
legend('show','Interpreter','latex')

% figure

% syms x y
% f = y.*sin(x)-x.*cos(y);
% fsurf(f,[-2*pi 2*pi])
% a = gca;
% a.TickLabelInterpreter = 'latex';
% a.Box = 'on';
% a.BoxStyle = 'full';
% 
% S = sym(a.XLim(1):pi/2:a.XLim(2));
% S = sym(round(vpa(S/pi*2))*pi/2);
% a.XTick = double(S);
% a.XTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
% 
% S = sym(a.YLim(1):pi/2:a.YLim(2));
% S = sym(round(vpa(S/pi*2))*pi/2);
% a.YTick = double(S);
% a.YTickLabel = strcat('$',arrayfun(@latex, S, 'UniformOutput', false),'$');
% 
% xlabel('x','Interpreter','latex');
% ylabel('y','Interpreter','latex');
% zlabel('z','Interpreter','latex');
% title(['$' latex(f) '$ for $x$ and $y$ in $[-2\pi,2\pi]$'],'Interpreter','latex')
% 
