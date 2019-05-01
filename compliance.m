function Cp = compliance(t)
global init_com MC

% init_com is the initial compliance value
% t is time
% MC is to scale how fast compliance is decreasing

Cp = init_com - MC*t;

