clc; clear; close all
cd mrst-2023b
startup
mrstModule add deckformat 
clc

init = readEclipseOutputFileUnFmt('../SKEW_48_28_35.INIT');
egrid = readEclipseOutputFileUnFmt('../SKEW_48_28_35.EGRID');
% init = readEclipseOutputFileUnFmt('./SKEW-E300_1.INIT');
% egrid = readEclipseOutputFileUnFmt('./SKEW-E300_1.EGRID');
[G, ~] = eclOut2mrst_mod(init, egrid);
G = computeGeometry(G);

node_coord = G.nodes.coords;
fn_node_ind = G.faces.nodes;
fn_indptr = [1:4:length(fn_node_ind)+4]; % pp requires this format
cf_face_ind = G.cells.faces(:,1);
cf_cell_ind = gridCellNo(G); % p. 90 documentation
cf_sgn = my_sign_map(G.cells.faces(:,2));

save ../mrst_grid % HARDCODED
cd ..
disp(' ')
disp('Done!')




