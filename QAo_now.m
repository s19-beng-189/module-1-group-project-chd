function Q=QAo_now(t)
%filename: QAo_now.m
global T TS TMAX QMAX;
tc=rem(t,T); % tc=time elapsed since 
%the beginning 6of the current cycle
%rem(t,T) is the remainder when t is divided by T

t_arrest = 0;  
t_restart= 0.001;
if (tc< t_restart & tc > t_arrest)
    Q = 0;
elseif(tc<TS)
  %SYSTOLE:
  if(tc<TMAX)
    %BEFORE TIME OF MAXIMUM FLOW:
    Q=QMAX*tc/TMAX;
  else 
    %AFTER TIME OF PEAK FLOW:
    Q=QMAX*(TS-tc)/(TS-TMAX);
  end
else
  %DIASTOLE: 
  Q=0;
end
