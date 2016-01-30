% This program solves a convection-diffusion problem 
% in a square domain [0,1]x[0,1] using bilinear elements.
% 

clear, close all, home

global diffusion  h 

disp(' ')
disp('This program solves a diffusion equation on [0,1]x[0,1]')
disp(' ')
disp('No source term is considered');

diffusion = input('Diffusion coefficient = ');
disp(' ')
nx = input('Number of elements in each direction = ');
ny = nx; h = 1/nx;


% GEOMETRY
% Matrix of nodel coordinates and conectivities
[X,T] = CreateMesh(0,1,0,1,nx,ny);

% NUMERICAL INTEGRATION
% Number of gauss points
ngaus = 4;
% Quadrature,Shape Functions
[n,wpg,pospg,N,dNdxi] = C2D4 ;

% SYSTEM RESULTING OF DISCRETIZING THE WEAK FORM
[K,f] = CreateMatrix(X,T,pospg,wpg,N,dNdxi);

% BOUNDARY CONDITIONS 
% Boundary conditions are imposed using Lagrange multipliers
nodes_y0 = [1:nx+1]';                           % Nodes on the boundary y=0
nodes_x1 = [2*(nx+1):nx+1:(ny+1)*(nx+1)]' ;     % Nodes on the boundary x=1
nodes_y1 = [ny*(nx+1)+nx:-1:ny*(nx+1)+1]' ;     % Nodes on the boundary y=1
nodes_x0 = [(ny-1)*(nx+1)+1:-(nx+1):nx+2]';     % Nodes on the boundary x=0

plot_BC;
disp ('On G1 solution is set to 1');
disp ('On G2 solution is set to 0');
disp ('On G3 either natural or essential homogeneous boundary conditions can be imposed.')
BC = input ('Condiciones en G3 (1:Neumann, 2: Dirichlet):  ');
if BC == 1   
    % nodes on which solution is u=1
    nodesDir1 = [nodes_x0(1:ny-2)];
    % nodes on which solution is u=0
    nodesDir0 = [nodes_x0(ny-1);nodes_y0];
    % Boundary condition matrix
    C = [nodesDir1, ones(length(nodesDir1),1);
         nodesDir0, zeros(length(nodesDir0),1)];
elseif BC == 2
    % nodes on which solution is u=1
    nodesDir1 = [nodes_x0(1:ny-2)];
    % nodes on which solution is u=0
    nodesDir0 = [nodes_x0(ny-1); nodes_y0; nodes_x1; nodes_y1 ];
    % Boundary condition matrix
    C = [nodesDir1, ones(length(nodesDir1),1);
         nodesDir0, zeros(length(nodesDir0),1)];
else 
    error ('Error imposing boundary conditions' );
end

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
multip = sol(neq+1:end);


% POSTPROCESS
figure(2), clf
[xx,yy,sol] = MatSol(X,nx,ny,Temp);
% surface(xx,yy,sol,'FaceColor',[1,1,1]);
surface(xx,yy,sol);
view([110,20])
set(gca, 'xTick',[0:0.25:1])
set(gca, 'yTick',[0:0.25:1])
set(gca, 'FontSize',12)
xlabel('x','FontSize',14); 
ylabel('y','FontSize',14); 
zlabel('u','FontSize',14);
grid on;

