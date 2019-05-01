%filename: in_sa.m  (initialization for the script sa)
T =0.0125;    %Duration of heartbeat (minutes)
TS=0.0050;    %Duration of systole   (minutes)
TMAX=0.0020;  %Time at which flow is max (minutes)
QMAX=28.0;    %Max flow through aortic valve (liters/minute)
Rs=17.86;     %Systemic resistance (mmHg/(liter/minute))
Csa=0.0022;   %Systemic arterial compliance (liters/(mmHg))
%This value of Csa is approximate and will need adjustment 
%to make the blood pressure be 120/80.

dt=0.01*T;       %Time step duration (minutes)
%This choice implies 100 timesteps per cardiac cycle.
klokmax=15*T/dt; %Total number of timesteps 
%This choice implies simulation of 15 cardiac cycles.
Psa=0;           %Initial value of Psa (mmHg)
%Any initial value is OK here; try some others.
%Initialize arrays to store data for plotting:
t_plot=zeros(1,klokmax);
QAo_plot=zeros(1,klokmax);
Psa_plot=zeros(1,klokmax);

%%% New paramters for our CHD project %%%
M = 5;               % scaling factor to determine how fast the radius is decreasing
MC = 0.01;           % scaling factor to dtermine how fast the compliance is decreasing
n_PaS =  0.003;      % viscosity in (Pascal*sec)
n = n_PaS*.0075/60;  % converted from (Pa*sec) to (mmHg*min)
L =  4.5658e+04;     % length of blood vessel of interest (cm)
init_rad = 1.25;     % initial radius (cm) 
init_com = 0.0022;   % initial compliance (liters/(mmHg))
delt_P = 100;        % pressure difference used in gen_flow.m (mmHg)
