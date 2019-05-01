% Want to modify this function so that QAo_now will depend on Rp
% Will assume constant delta P 
% Function is derived from Poiseuille's Law

function Q=QAo_now(t)
%filename: QAo_now.m
global T TS TMAX;
global delt_P Rp;

tc=rem(t,T); % tc=time elapsed since 
%the beginning of the current cycle
%rem(t,T) is the remainder when t is divided by T
if(tc<TS)
  %SYSTOLE:
  if(tc<TMAX)
    %BEFORE TIME OF MAXIMUM FLOW:
    Q=(delt_P/Rp)*tc/TMAX;          % QMAX is now replace by delt_P/Rp
  else
    %AFTER TIME OF PEAK FLOW:
    Q=(delt_P/Rp)*(TS-tc)/(TS-TMAX);
  end
else
  %DIASTOLE:
  Q=0;
end
