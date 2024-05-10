
clc; clear; close all
mrstModule add deckformat

% G = readGRDECL("/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/Grid.GRDECL")
% G = computeGeometry(G)
% plotGrid(G)

% [y,x,z]  = peaks(15); z = z+8;
% horizons = {struct('x',x,'y',y,'z',z),struct('x',x,'y',y,'z',z+8)};
% grdecl = convertHorizonsToGrid(horizons,'layers', 4);
% G = processGRDECL(grdecl);
% 
% plotGrid(G)

% G = readGRDECL("/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SIMPLE.EGRID")

% deck = readEclipseDeck("/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SIMPLE.EGRID")
% deck.GRID

init = readEclipseOutputFileUnFmt('/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SIMPLE.INIT');
egrid = readEclipseOutputFileUnFmt('/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SIMPLE.EGRID');
init = readEclipseOutputFileUnFmt('/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SKEW-E300_1.INIT');
egrid = readEclipseOutputFileUnFmt('/home/inspiron/Desktop/PhD/7-eni/enricoeni/Tesi/SKEW-E300_1.EGRID');
[G, rock] = eclOut2mrst(init, egrid);
G = computeGeometry(G);

% figure
% plotGrid(G, 'FaceColor', 'none'); view(3)
% plotGrid(G, [1:4], 'FaceColor', 'r')
% figure
% plotFaces(G, 'FaceColor', 'none'); view(3)
% plotFaces(G, [1:3], 'r'); view(3)
% figure
% plotFaces(G, 'FaceColor', 'none'); view(3)
% plotFaces(G, [1, 9, 17, 23, 35, 36], 'r'); view(3)
% axis equal

node_coord = G.nodes.coords;
fn_node_ind = G.faces.nodes;
% fn_face_ind = [1:52]'*ones(1,4); % p. 90 documentation
fn_indptr = [1:4:length(fn_node_ind)+4]; % but pp wants this
cf_face_ind = G.cells.faces(:,1);
cf_cell_ind = gridCellNo(G); % p. 90 documentation
cf_sgn = my_sign_map(G.cells.faces(:,2));

% G.cells.faces
% cf_sgn([1:6])

clc
nodes_face_1 = G.faces.nodes(1:4)
G.nodes.coords(nodes_face_1,:)
figure
plotFaces(G, 'FaceColor', 'none'); view(3)
plotFaces(G, [9], 'r'); view(3)


save mrst_grid
disp('Done!')




