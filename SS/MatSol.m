function [xx,yy,sol] = MatSol(X,nx,ny,Temp)
% [xx,yy,sol] = MatSol(X,nx,ny,Temp)
% This function creates matrices necessary to plot the solution 
% using the Matlab function surf, provided that the computational
% mesh is structured.
% X:    nodal coordinates
% T:    connectivities (elements)
% Temp: nodal values vector
%

for i=1:ny+1
    posi = [(i-1)*(nx+1)+1:i*(nx+1)];					    
    xx(i,:) = X(posi,1)';
    yy(i,:) = X(posi,2)';
    sol(i,:)= Temp(posi)';
end
