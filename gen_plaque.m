% The purpose of this function is to simulate the build up of plaque around
% the wall of the artery by varying the radius of the vessel overtime.

function rad= gen_plaque(curr_rad,t) 
global M;

% curr_rad is the current radius of the blood vessel
% M is to scale how fast radius is decreasing 
% t is the current time [min]

rad = curr_rad - M*t; 





