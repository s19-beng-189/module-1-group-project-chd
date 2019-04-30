% The purpose of this function is to simulate the build up of plaque around
% the wall of the artery by varying the radius of the vessel overtime.

function Rad= gen_plaque(t) % Rad = radius of the blood vessel
global T;
y = m*t+b; % the idea here is to model Rs as a linear funct overtime
Rad = y;





