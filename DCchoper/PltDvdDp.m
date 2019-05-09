% function Harm2
clc
clear all
close all

global nH

Dvec = [0.1:0.05:0.9] ;
fun = @DprimCalc;

for j = 1:1000
    nH = j ;
    Deq = 0 ;
    for i = 1:length(Dvec)
        
        x0 = Dvec(i) ;
        Deq = fsolve(fun,x0) ;
        Deqvec(j,i) = Deq ;
    end
    
end
plot(Dvec,Deqvec)

xlabel('D')
ylabel('D_{eq}')