% The purpose of this function is to simulate the build up of plaque around
% the wall of the artery by varying the radius of the vessel overtime.

function rad= gen_plaque(current_rad,m,t) % Rad = radius of the blood vessel
% m scaling factor, t is the current time (min)

rad = current_rad - m*t; % the idea here is to model Rs as a linear funct overtime






