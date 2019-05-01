%filename: sa.m
clear all % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt;
global M MC init_rad init_com;

in_sa %initialization
Csa=Csa/2;

for klok=1:klokmax
  t=klok*dt;
  QAo=QAo_now(t);
  
  % MAKE SURE TO ONLY USE ONE CODE AND COMMENT OUT THE OTHER
  % All these codes are to observe changes in BP
  
  %%% Code 1 to observe changes in Rp and its affect on BP
  rad = gen_plaque(t);        % generate radius due to plaque buildup
  Rp = resistance(n,L,rad);   % calc resistance due to change in radius
  % make sure Rp is an input in Psa_new.m
  Psa=Psa_new(Psa,QAo,Rp);    % new Psa overwrites old
  Rp_plot(klok)= Rp;          % store each Rp value overtime
  
  
  %%% Code 2 to increase Rp & then drop it back to Rs
  if klok < 250               % specify the time of instantaneous change
    rad = gen_plaque(t);      % generate radius due to plaque buildup
    Rp = resistance(n,L,rad); % calc resistance due to change in radius
    % make sure Rp is an input in Psa_new.m
    Psa=Psa_new(Psa,QAo,Rp);  % new Psa overwrites old
    Rp_plot(klok)= Rp;        % store each Rp value overtime
  else
    Psa=Psa_new(Psa,QAo,Rs);  % observe BP when Rp drops to Rs
    Rp_plot(klok)= Rs;        % set to Rp to Rs for plotting
  end
  
  
  %%% Code 3 to increase Rp & then hold it constant at specified time
  if klok < 250               % specify the time of instantaneous change
    rad = gen_plaque(t);      % generate radius due to plaque buildup
    Rp = resistance(n,L,rad); % calc resistance due to change in radius
    % make sure Rp is an input in Psa_new.m
    Psa=Psa_new(Psa,QAo,Rp);  % new Psa overwrites old
  else
    Psa=Psa_new(Psa,QAo,Rp);  % Hold to Rp constant at klok
  end
  Rp_plot(klok)= Rp;          % store each Rp value overtime
  
  
  %%% Code 4 to observe changes in Cp and its affect on BP
  Cp = compliance(t);         % generate compliance due to plaque buildup
  % make sure Cp is an input in Psa_new.m
  Psa=Psa_new(Psa,QAo,Cp);    % new Psa overwrites old
  Cp_plot(klok)= Cp;          % store each Cp value overtime
  
  
  %%% Code 5 to decrease Cp & then increase it back up to Csa
  if klok < 500               % specify the time of instantaneous change
    Cp = compliance(t);       % generate compliance due to plaque buildup
    % make sure Cp is an input in Psa_new.m
    Psa=Psa_new(Psa,QAo,Cp);  % new Psa overwrites old
    Cp_plot(klok)= Cp;        % store each Cp value overtime
  else
    Psa=Psa_new(Psa,QAo,Csa); % observe BP when Rp drops to Rs
    Cp_plot(klok)= Csa;       % set to Cp to Csa for plotting
  end
  
  
  %%% Code 6 to descrease Cp & then hold it constant at specified time
  if klok < 300               % specify the time of instantaneous change
    Cp = compliance(t);       % generate compliance due to plaque buildup
    % make sure Cp is an input in Psa_new.m
    Psa=Psa_new(Psa,QAo,Cp);  % new Psa overwrites old
  else
    Psa=Psa_new(Psa,QAo,Cp);  % Hold to Cp constant at klok
  end
  Cp_plot(klok)= Cp;          % store each Cp value overtime
  
  
  %%% Code 7 to observe changes in both Rp & Cp and their affect on BP
  rad = gen_plaque(t);        % generate radius due to plaque buildup
  Rp = resistance(n,L,rad);   % calc resistance due to change in radius
  Cp = compliance(t);         % generate compliance due to plaque buildup
  % make sure Rp & Cp are inputs in Psa_new.m
  Psa=Psa_new(Psa,QAo,Rp,Cp); % new Psa overwrites old
  Rp_plot(klok)= Rp;          % store each Rp value overtime
  Cp_plot(klok)= Cp;          % store each Cp value overtime
  
 
  
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;  
  Psa_plot(klok)=Psa;

end
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame

subplot(4,1,1), plot(t_plot,QAo_plot)
xlabel('Time (min)')
ylabel('Flow (L/min)')
title('Blood Flow')

subplot(4,1,2), plot(t_plot,Psa_plot)
xlabel('Time (min)')
ylabel('Psa (mmHg)')
title('Systolic Blood Pressure')

% Plotting Resistance overtime
subplot(4,1,3), plot(t_plot,Rp_plot)
xlabel('Time (min)')
ylabel('Rp (mmHg/(L/min))')
title('Resistance Rp')

% Plotting Compliance overtime
subplot(4,1,4), plot(t_plot,Cp_plot)
xlabel('Time (min)')
ylabel('Cp (L/mmHg)')
title('Compliance cP')
