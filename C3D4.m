function [n,w,xi,N,dNdxi]=C3D4
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = 1;
ncoord=3;  
nodes=4;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

         xi(1,1) = 0.25;
         xi(2,1) = 0.25;
         xi(3,1) = 0.25;
         
         w(1) = 1./6.;
%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=zeros(nodes,1);
       N(1) = xi(1);
       N(2) = xi(2);
       N(3) = xi(3);
       N(4) = 1.-xi(1)-xi(2)-xi(3);

%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(4,4);
       dNdxi(1,1) = 1.;
       dNdxi(2,2) = 1.;
       dNdxi(3,3) = 1.;
       dNdxi(4,1) = -1.;
       dNdxi(4,2) = -1.;
       dNdxi(4,3) = -1.;
end
%
