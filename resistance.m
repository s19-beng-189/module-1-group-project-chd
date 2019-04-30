% The purpose of this function is to calculate the resistance 'Rp' to blood
% flow due to the varying radius 'rad' generated from gen_plaque.m
% This function is derived from Poiseuille's law.

function Rp = resistance(n,L,rad)  

%n is the viscocity of the vessel [mmHg*min]
%L is the length of the vessel [cm]
%rad is the radius of the vessel [cm]

Rp_unscaled = 8 * n * L/ (pi * rad^4); % [mmHg/(mL/min)]
Rp = Rp_unscaled*1000; % multiply by 1000 to change from mL to L

