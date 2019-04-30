%n is the viscocity of the vessel
%L is the length of the vessel
%rad is the radius of the vessel

function Rp = resistance(n,L,rad)

Rp = 8 * n * L/ (pi * rad^4);


end

