function [n,w,xi,N,dNdxi]=C2D4
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = 4;
ncoord=2;  
nodes=4;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

         xi(1,1) = -0.5773502692;
         xi(2,1) = xi(1,1);
         xi(1,2) = -xi(1,1);
         xi(2,2) = xi(1,1);
         xi(1,3) = xi(1,1);
         xi(2,3) = -xi(1,1);
         xi(1,4) = -xi(1,1);
         xi(2,4) = -xi(1,1);


         w = [1.,1.,1.,1.];
%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=zeros(n,n);
for i1=1:n
       N(i1,1) = 0.25*(1.-xi(1,i1))*(1.-xi(2,i1));
       N(i1,2) = 0.25*(1.+xi(1,i1))*(1.-xi(2,i1));
       N(i1,3) = 0.25*(1.+xi(1,i1))*(1.+xi(2,i1));
       N(i1,4) = 0.25*(1.-xi(1,i1))*(1.+xi(2,i1));
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(nodes,ncoord*n);
for i1=1:n
       dNdxi(1,i1*2-1) = -0.25*(1.-xi(2,i1));
       dNdxi(1,i1*2) = -0.25*(1.-xi(1,i1));
       dNdxi(2,i1*2-1) = 0.25*(1.-xi(2,i1));
       dNdxi(2,i1*2) = -0.25*(1.+xi(1,i1));
       dNdxi(3,i1*2-1) = 0.25*(1.+xi(2,i1));
       dNdxi(3,i1*2) = 0.25*(1.+xi(1,i1));
       dNdxi(4,i1*2-1) = -0.25*(1.+xi(2,i1));
       dNdxi(4,i1*2) = 0.25*(1.-xi(1,i1));
end
end
%
