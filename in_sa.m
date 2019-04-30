%filename: in_sa.m  (initialization for the script sa)
T =0.0125    %Duration of heartbeat (minutes)
TS=0.0050    %Duration of systole   (minutes)
TMAX=0.0020  %Time at which flow is max (minutes)
QMAX=28.0    %Max flow through aortic valve (liters/minute)
Rs=17.86     %Systemic resistance (mmHg/(liter/minute))
Csa=0.0022   %Adjusted Csa for task 2

m = .001 %Scaled radius slope

n =  1000 * 3.75030783 * 10^-7%pascals * seconds %3.75030783e-7 mmHg * min
L =  4.5658e+04 %cm
current_rad = 1.25; %cm
%Csa_old=0.00175  %Systemic arterial compliance (liters/(mmHg))
%This value of Csa is approximate and will need adjustment 
%to make the blood pressure be 120/80.
dt=0.01*T    %Time step duration (minutes)
%This choice implies 100 timesteps per cardiac cycle.
klokmax=15*T/dt %Total number of timesteps 
%This choice implies simulation of 15 cardiac cycles.
Psa=0           %Initial value of Psa (mmHg)
%Any initial value is OK here; try some others.
%Initialize arrays to store data for plotting:
t_plot=zeros(1,klokmax);
QAo_plot=zeros(1,klokmax);
Psa_plot=zeros(1,klokmax);

