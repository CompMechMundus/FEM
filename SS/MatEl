function [Ke,fe] = MatEl(Xe,nnode,pospg,wpg,N,dNdxi) 
% [Ke,fe] = MatEl(Xe,nnode,pospg,wpg,N,Nxi,Neta) 
% Element stiffness matrix Ke and r.h.s vector fe
% 
% Xe:           nodal coordinates
% nnode:        number of nodes
% pospg, wpg:   Gauss points and weigths on the reference element
% N,Nxi,Neta:   shape functions and its derivatives (using local coordinates)
%               on the Gauss points
% 

global diffusion  h  
 
nu = diffusion;

Ke = zeros(nnode,nnode); 
fe = zeros(nnode,1); 
 
% Numer of Gauss points
ngaus = size(pospg,2); 
 
% Loop on Gauss points (computation of integrals on the current element)
for igaus = 1:ngaus 
    N_igaus = N(igaus,:);  
    Nxi_igaus = dNdxi(2*igaus-1,:);   
    Neta_igaus = dNdxi(2*igaus,:);   
    Jacob = [Nxi_igaus*(Xe(:,1))	Nxi_igaus*(Xe(:,2))   
             Neta_igaus*(Xe(:,1))	Neta_igaus*(Xe(:,2))]; 
    dvolu = wpg(igaus)*det(Jacob); 
    res = Jacob\[Nxi_igaus;Neta_igaus]; 
    Nx = res(1,:); 
    Ny = res(2,:); 
    
    Ke = Ke + (nu*(Nx'*Nx+Ny'*Ny))*dvolu; 
    aux = Isopar(Xe,N_igaus);
    f_igaus = SourceTerm(aux); 
    fe = fe + N_igaus'*(f_igaus*dvolu);
end 
