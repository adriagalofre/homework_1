function [n,w,xi,N,dNdxi]=C3D20
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = 27;
ncoord=3;  
nodes=20;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

 x1D = [-0.7745966692,0.,0.7745966692];
         for k = 1:3
           for j = 1:3
             for i = 1:3
               n = 9*(k-1) + 3*(j-1) + i;
               xi(1,n) = x1D(i);
               xi(2,n) = x1D(j);
               xi(3,n) = x1D(k);
             end
           end
         end
         
w1D = [0.555555555,0.888888888,0.55555555555];
         for k = 1:3
           for j = 1:3
             for i = 1:3
               n = 9*(k-1)+3*(j-1)+i;
               w(n) = w1D(i)*w1D(j)*w1D(k);
             end
           end    
         end
%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=zeros(n,n);
for i1=1:n
       N(i1,1) = (1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3))*(-xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)/8.;
       N(i1,2) = (1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3))*(xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)/8.;
       N(i1,3) = (1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3))*(xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)/8.;
       N(i1,4) = (1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3))*(-xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)/8.;
       N(i1,5) = (1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3))*(-xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)/8.;
       N(i1,6) = (1.+xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3))*(xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)/8.;
       N(i1,7) = (1.+xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3))*(xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)/8.;
       N(i1,8) = (1.-xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3))*(-xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)/8.;
       N(i1,9)  = (1.-xi(i1,1)^2)*(1.-xi(i1,2))*(1.-xi(i1,3))/4.;
       N(i1,10) = (1.+xi(i1,1))*(1.-xi(i1,2)^2)*(1.-xi(i1,3))/4.;
       N(i1,11) = (1.-xi(i1,1)^2)*(1.+xi(i1,2))*(1.-xi(i1,3))/4.;
       N(i1,12) = (1.-xi(i1,1))*(1.-xi(i1,2)^2)*(1.-xi(i1,3))/4.;
       N(i1,13) = (1.-xi(i1,1)^2)*(1.-xi(i1,2))*(1.+xi(i1,3))/4.;
       N(i1,14) = (1.+xi(i1,1))*(1.-xi(i1,2)^2)*(1.+xi(i1,3))/4.;
       N(i1,15) = (1.-xi(i1,1)^2)*(1.+xi(i1,2))*(1.+xi(i1,3))/4.;
       N(i1,16) = (1.-xi(i1,1))*(1.-xi(i1,2)^2)*(1.+xi(i1,3))/4.;
       N(i1,17) = (1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       N(i1,18) = (1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       N(i1,19) = (1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       N(i1,20) = (1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)^2)/4.;
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       dNdxi(i1*3-2,1) = (-(1.-xi(i1,2))*(1.-xi(i1,3))*(-xi(1)-xi(i1,2)-xi(i1,3)-2.)-(1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3-1,1) = (-(1.-xi(i1,1))*(1.-xi(i1,3))*(-xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)-(1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3,1) = (-(1.-xi(i1,1))*(1.-xi(i1,2))*(-xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)-(1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;

       dNdxi(i1*3-2,2) = ((1.-xi(i1,2))*(1.-xi(i1,3))*(xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)+(1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3-1,2) = (-(1.+xi(i1,1))*(1.-xi(i1,3))*(xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)-(1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3,2) = (-(1.+xi(i1,1))*(1.-xi(i1,2))*(xi(i1,1)-xi(i1,2)-xi(i1,3)-2.)-(1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3)))/8.;

       dNdxi(i1*3-2,3) = ((1.+xi(i1,2))*(1.-xi(i1,3))*(xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)+(1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3-1,3) = ((1.+xi(i1,1))*(1.-xi(i1,3))*(xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)+(1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3,3) = (-(1.+xi(i1,1))*(1.+xi(i1,2))*(xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)-(1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;

       dNdxi(i1*3-2,4) = (-(1.+xi(i1,2))*(1.-xi(i1,3))*(-xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)-(1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3-1,4) = ((1.-xi(i1,1))*(1.-xi(i1,3))*(-xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)+(1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;
       dNdxi(i1*3,4) = (-(1.-xi(i1,1))*(1.+xi(i1,2))*(-xi(i1,1)+xi(i1,2)-xi(i1,3)-2.)-(1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3)))/8.;
       
       dNdxi(i1*3-2,5) = (-(1.-xi(i1,2))*(1.+xi(i1,3))*(-xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)-(1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3-1,5) = (-(1.-xi(i1,1))*(1.+xi(i1,3))*(-xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)-(1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3,5) = ((1.-xi(i1,1))*(1.-xi(i1,2))*(-xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)+(1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       
       dNdxi(i1*3-2,6) = ((1.-xi(i1,2))*(1.+xi(i1,3))*(xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)+(1.+xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3-1,6) = (-(1.+xi(i1,1))*(1.+xi(i1,3))*(xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)-(1.+xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3,6) = ((1.+xi(i1,1))*(1.-xi(i1,2))*(xi(i1,1)-xi(i1,2)+xi(i1,3)-2.)+(1.+xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3)))/8.;
       
       dNdxi(i1*3-2,7) = ((1.+xi(i1,2))*(1.+xi(i1,3))*(xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)+(1.+xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3-1,7) = ((1.+xi(i1,1))*(1.+xi(i1,3))*(xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)+(1.+xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3,7) = ((1.+xi(i1,1))*(1.+xi(i1,2))*(xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)+(1.+xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       
       dNdxi(i1*3-2,8) = (-(1.+xi(i1,2))*(1.+xi(i1,3))*(-xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)-(1.-xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3-1,8) = ((1.-xi(i1,1))*(1.+xi(i1,3))*(-xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)+(1.-xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       dNdxi(i1*3,8) = ((1.-xi(i1,1))*(1.+xi(i1,2))*(-xi(i1,1)+xi(i1,2)+xi(i1,3)-2.)+(1.-xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3)))/8.;
       
       dNdxi(i1*3-2,9)  = -2.*xi(i1,1)*(1.-xi(i1,2))*(1.-xi(i1,3))/4.;
       dNdxi(i1*3-1,9)  = -(1.-xi(i1,1)^2)*(1.-xi(i1,3))/4.;
       dNdxi(i1*3,9)  = -(1.-xi(i1,1)^2)*(1.-xi(i1,2))/4.;
       
       dNdxi(i1*3-2,10)  = (1.-xi(i1,2)^2)*(1.-xi(i1,3))/4.;
       dNdxi(i1*3-1,10)  = -2.*xi(i1,2)*(1.+xi(i1,1))*(1.-xi(i1,3))/4.;
       dNdxi(i1*3,10)  = -(1.-xi(i1,2)^2)*(1.+xi(i1,1))/4.;
       
       dNdxi(i1*3-2,11)  = -2.*xi(i1,1)*(1.+xi(i1,2))*(1.-xi(i1,3))/4.;
       dNdxi(i1*3-1,11)  = (1.-xi(i1,1)^2)*(1.-xi(i1,3))/4.;
       dNdxi(i1*3,11)  = -(1.-xi(i1,1)^2)*(1.+xi(i1,2))/4.;
       
       dNdxi(i1*3-2,12)  = -(1.-xi(i1,2)^2)*(1.-xi(i1,3))/4.;
       dNdxi(i1*3-1,12)  = -2.*xi(i1,2)*(1.-xi(i1,1))*(1.-xi(i1,3))/4.;
       dNdxi(i1*3,12)  = -(1.-xi(i1,2)^2)*(1.-xi(i1,1))/4.;
       
       dNdxi(i1*3-2,13)  = -2.*xi(i1,1)*(1.-xi(i1,2))*(1.+xi(i1,3))/4.;
       dNdxi(i1*3-1,13)  = -(1.-xi(i1,1)^2)*(1.+xi(i1,3))/4.;
       dNdxi(i1*3,13)  = (1.-xi(i1,1)^2)*(1.-xi(i1,2))/4.;
       
       dNdxi(i1*3-2,14)  = (1.-xi(i1,2)^2)*(1.+xi(i1,3))/4.;
       dNdxi(i1*3-1,14)  = -2.*xi(i1,2)*(1.+xi(i1,1))*(1.+xi(i1,3))/4.;
       dNdxi(i1*3,14)  = (1.-xi(i1,2)^2)*(1.+xi(i1,1))/4.;
       
       dNdxi(i1*3-2,15)  = -2.*xi(i1,1)*(1.+xi(i1,2))*(1.+xi(i1,3))/4.;
       dNdxi(i1*3-1,15)  =  (1.-xi(i1,1)^2)*(1.+xi(i1,3))/4.;
       dNdxi(i1*3,15)  = (1.-xi(i1,1)^2)*(1.+xi(i1,2))/4.;
       
       dNdxi(i1*3-2,16)  = -(1.-xi(i1,2)^2)*(1.+xi(i1,3))/4.;
       dNdxi(i1*3-1,16)  = -2.*xi(i1,2)*(1.-xi(i1,1))*(1.+xi(i1,3))/4.;
       dNdxi(i1*3,16)  = (1.-xi(i1,2)^2)*(1.-xi(i1,1))/4.;
       
       dNdxi(i1*3-2,17) = -(1.-xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3-1,17) = -(1.-xi(i1,1))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3,17) = -xi(3)*(1.-xi(i1,1))*(1.-xi(i1,2))/2.;
       
       dNdxi(i1*3-2,18) = (1.-xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3-1,18) = -(1.+xi(i1,1))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3,18) = -xi(3)*(1.+xi(i1,1))*(1.-xi(i1,2))/2.;
       
       dNdxi(i1*3-2,19) = (1.+xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3-1,19) = (1.+xi(i1,1))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3,19) = -xi(3)*(1.+xi(i1,1))*(1.+xi(i1,2))/2.;
       
       dNdxi(i1*3-2,20) = -(1.+xi(i1,2))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3-1,20) = (1.-xi(i1,1))*(1.-xi(i1,3)^2)/4.;
       dNdxi(i1*3,20) = -xi(3)*(1.-xi(i1,1))*(1.+xi(i1,2))/2.;
end
end
%
