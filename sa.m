%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt;
global M init_rad;

in_sa %initialization
Csa=Csa/2;

for klok=1:klokmax
  t=klok*dt;
  
  rad = gen_plaque(t);      % generate radius due to plaque buildup
  Rp = resistance(n,L,rad); % calc resistance due to change in radius
  
  QAo=QAo_now(t);
  
  if klok < 750   
    Psa=Psa_new(Psa,QAo,Rp); %new Psa overwrites old
    Rp_plot(klok)= Rp;
  else
      Psa=Psa_new(Psa,QAo,Rs);
      Rp_plot(klok)= Rs;
  end
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;  
  Psa_plot(klok)=Psa;

end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame

subplot(3,1,1), plot(t_plot,QAo_plot)
xlabel('Time (min)')
ylabel('Flow (L/min)')
title('Blood Flow')

subplot(3,1,2), plot(t_plot,Psa_plot)
xlabel('Time (min)')
ylabel('Psa (mmHg)')
title('Systolic Blood Pressure')

subplot(3,1,3), plot(t_plot,Rp_plot)
xlabel('Time (min)')
ylabel('Rp (mmHg/(L/min))')
title('Resistance Rp')
