% This program solves a diffusion problem 

clear, close all, home

% GEOMETRY
% Matrix of nodel coordinates and conectivities
% idX X: id for the node X and coordinates X
% other variables: nidX,ndof,nX
% idT T: id for the elem X and connectivities
% other variables: nidT,nT

% NUMERICAL INTEGRATION
% Variables to be defined: ngaus, pospg, wpg, N, Nxi, Neta 

% SYSTEM RESULTING OF DISCRETIZING THE WEAK FORM
% Define global and element stiffens matrix, K and Ke
% Define global and element stiffens matrix, F and Fe

% BOUNDARY CONDITIONS 
% 1: Neumann: nodes on which solution is known and values
% 2: Dirichlet: nodes on which natural BC is known and values
% Dirichlet BC will be enforce by lagrange multipliers

ndir = size(C,1);
neq  = size(f,1);
A = zeros(ndir,neq);
A(:,C(:,1)) = eye(ndir);
b = C(:,2);


% SOLUTION OF THE LINEAR SYSTEM
% Entire matrix
Ktot = [K A';A zeros(ndir,ndir)];
ftot = [f;b];

sol = Ktot\ftot;
Temp = sol(1:neq);

% POSTPROCESS
% A vtk file have to be created.

