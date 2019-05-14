% function Harm2
clc
clear all
close all

global nH

Dvec = [0.1:0.05:0.9] ;
fun = @DprimCalc;

clm = colormap(jet(1000)) ;

for j = 4:4
    nH = j ;
    Deq = 0 ;
    for i = 1:length(Dvec)
        
        x0 = Dvec(i) ;
        Deq = fsolve(fun,x0) ;
        Deqvec(j,i) = Deq ;
    end
    plot(Dvec,Deqvec(j,:),'-o','MarkerSize',3,'MarkerEdgeColor',clm(j,:),'MarkerFaceColor',clm(j,:)) ;
    hold on
end


xlabel('D')
ylabel('D_{eq}')