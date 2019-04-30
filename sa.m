%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX; 
global Csa dt;
global M; 

in_sa %initialization
Csa=Csa/2;  % Dividing the compliance by 2

for klok=1:klokmax
  t=klok*dt; 
  
  %%% MODIFICATION FOR PROJECT %%%
  rad = gen_plaque(curr_rad,t);  % generate radius due to plaque buildup
  Rp = resistance(n,L,rad);      % calc resistance due to change in radius
  curr_rad = rad;                % overwrites old curr_rad
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %%%%% Things to consider %%%%%
 % Should we plot the pulse pressure against resistance?
 % Should we plot radius and resistance over time?
 % Consider aging and changing compliance?
 % How can we mimic a heart attack? when QAo = 0 during systole
  
  QAo=QAo_now(t);
  Psa=Psa_new(Psa,QAo,Rp); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;
  Psa_plot(klok)=Psa;
  
end
%Now plot results in one figure 
%with QAo(t) in upper frame
%and Psa(t) in lower frame
subplot(2,1,1), plot(t_plot,QAo_plot)
xlabel('Time (m)')
ylabel('Flow (L/m)')

subplot(2,1,2), plot(t_plot,Psa_plot)
xlabel('Time (m)')
ylabel('Pressure (mmHg)')

[pks,l1] = findpeaks(Psa_plot);
for i = 1:length(pks)
   err_pk(i) = abs(pks(i) - 120);
   err_pk_percent(i) = (err_pk(i)/120)*100;
end

[pks2,l2] = findpeaks(-Psa_plot);
tro = -pks2;
for i = 1:length(tro)
   err_tro(i) = abs(tro(i) - 80);
   err_tro_percent(i) = (err_tro(i)/80)*100;
end

delt_t_pk = l1*dt;
delt_t_tro =l2*dt;





