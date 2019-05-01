%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt;
global M MC init_rad init_com;
global delt_P Rp;

in_sa %initialization
Csa=Csa/2;

for klok=1:klokmax
  t=klok*dt;
  
  % MAKE SURE TO ONLY USE ONE CODE AND COMMENT OUT THE OTHER
  % All these codes are to observe changes in flow rate through aortic valve
  
  %%% Code 1 to observe changes in Rp and its affect on QAo
  rad = gen_plaque(t);        % generate radius due to plaque buildup
  Rp = resistance(n,L,rad);   % calc resistance due to change in radius
  QAo=QAo_now(t);             
  Rp_plot(klok)= Rp;          % store each Rp value overtime
  
 
  %%% Code 2 to increase Rp & then drop it back to Rs
  if klok < 300               % specify the time of instantaneous change
    rad = gen_plaque(t);      % generate radius due to plaque buildup
    Rp = resistance(n,L,rad); % calc resistance due to change in radius
    QAo=QAo_now(t);
    Rp_plot(klok)= Rp;        % store each Rp value overtime
  else
      QAo=QAo_now(t);
    Rp_plot(klok)= Rs;        % set to Rp to Rs for plotting
  end
  
  
  %%% Code 3 to increase Rp & then hold it constant at specified time
  if klok < 300               % specify the time of instantaneous change
    rad = gen_plaque(t);      % generate radius due to plaque buildup
    Rp = resistance(n,L,rad); % calc resistance due to change in radius
    QAo=QAo_now(t);
  else
    QAo=QAo_now(t);  
  end
  Rp_plot(klok)= Rp;          % store each Rp value overtime

 
 
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;  
  Psa_plot(klok)=Psa;

end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame

subplot(2,1,1), plot(t_plot,QAo_plot)
xlabel('Time (min)')
ylabel('Flow (L/min)')
title('Blood Flow')

% subplot(4,1,2), plot(t_plot,Psa_plot)
% xlabel('Time (min)')
% ylabel('Psa (mmHg)')
% title('Systolic Blood Pressure')

% Plotting Resistance overtime
subplot(2,1,2), plot(t_plot,Rp_plot)
xlabel('Time (min)')
ylabel('Rp (mmHg/(L/min))')
title('Resistance Rp')

% % Plotting Compliance overtime
% subplot(4,1,4), plot(t_plot,Cp_plot)
% xlabel('Time (min)')
% ylabel('Cp (L/mmHg)')
% title('Compliance cP')
