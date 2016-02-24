function [n,w,xi,N,dNdxi]=C2D6
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = 3;
ncoord=2;  
nodes=6;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%
         xi(1,1) = 0.6;
         xi(2,1) = 0.2;
         xi(1,2) = 0.2;
         xi(2,2) = 0.6;
         xi(1,3) = 0.2;
         xi(2,3) = 0.2;
         
         w= [1./6.,1./6.,1./6.];
%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]
N=zeros(nodes,1);
xi3 = 1.-xi(1)-xi(2);
       N(1) = (2.*xi(1)-1.)*xi(1);
       N(2) = (2.*xi(2)-1.)*xi(2);
       N(3) = (2.*xi3-1.)*xi3;
       N(4) = 4.*xi(1)*xi(2);
       N(5) = 4.*xi(2)*xi3;
       N(6) = 4.*xi3*xi(1);
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(ncoord*n,nodes);
 xi3 = 1.-xi(1)-xi(2);
       dNdxi(1,1) = 4.*xi(1)-1.;
       dNdxi(2,2) = 4.*xi(2)-1.;
       dNdxi(3,1) = -(4.*xi3-1.);
       dNdxi(3,2) = -(4.*xi3-1.);
       dNdxi(4,1) = 4.*xi(2);
       dNdxi(4,2) = 4.*xi(1);
       dNdxi(5,1) = -4.*xi(2);
       dNdxi(5,2) = -4.*xi(1);
       dNdxi(6,1) = 4.*xi3 - 4.*xi(1);
       dNdxi(6,2) = 4.*xi3 - 4.*xi(2);
end