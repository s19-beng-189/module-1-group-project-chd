% The purpose of this function is to calculate blood pressure, which  

function Psa=Psa_new(Psa_old,QAo,Rp)
%filename:   Psa_new.m
global Csa dt;
Psa=(Psa_old+dt*QAo/Csa)/(1+dt/(Rp*Csa));


