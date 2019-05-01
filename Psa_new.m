% The purpose of this function is to calculate blood pressure.

function Psa=Psa_new(Psa_old,QAo,Cp)
%filename:   Psa_new.m
global Rs dt;
Psa=(Psa_old+dt*QAo/Cp)/(1+dt/(Rs*Cp));
