function signs = my_sign_map(orientations)
% see p. 89 and fig. p.92 
% 1 = west = -1
% 2 = east = 1
% 3 = south = -1
% 4 = north = 1
% 5 = bottom = -1
% 6 = top = 1
% 

signs = not(mod(orientations,2))*2 - 1;


