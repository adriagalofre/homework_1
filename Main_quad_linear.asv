% This program solves a convection-diffusion problem 
% in the domain proposed in HM1
% 

clear, close all, home

global diffusion  h 

disp(' ')
disp('This program solves a diffusion equation on the HM-1s geometry')
disp(' ')
disp('No source term is considered')
disp(' ')
disp('Diffusion coefficient = 1');



diffusion = 1;

% GEOMETRY
%nodes=input('Enter nodes matrix name');
%elements=input('Enter elements matrix name');
%X= load ('nodes');
%T= load ('elments');

X= load ('nodes_2D_quad_linear.dat');
T= load ('elm_2D_quad_linear.dat');
[nXi,nXy]=size(X);
[nTi,nTy]=size(T);

%ELEMENT TYPE
%elmtype=input('Enter element type_1:Triangulars,2:Quadrilaterals,3:Tetrahedrals,4:Hexhahedrals  ');
%elmord=input('Enter order of element_1:linear,2:quadratic  ');

% NUMERICAL INTEGRATION
% Quadrature,Shape Functions

if nXy==3                     % 2D element
    if nTy==4        
        [n,wpg,pospg,N,dNdxi] = C2D3 ;  %triangular linear
    elseif nTy==5
        [n,wpg,pospg,N,dNdxi] = C2D4 ;  %quad linear
    elseif nTy==7
        [n,wpg,pospg,N,dNdxi] = C2D6 ;  %triangular quadratic
    elseif nTy==9
        [n,wpg,pospg,N,dNdxi] = C2D8 ;  %quad quadratic
    elseif nTy==10
        [n,wpg,pospg,N,dNdxi] = C2D9 ;
    end

elseif nXy==4                 % 3D element
    if nTy==5        
        [n,wpg,pospg,N,dNdxi] = C3D4 ;  %tetrahedral linear
    elseif nTy==9
        [n,wpg,pospg,N,dNdxi] = C3D8 ;  %hexahedral linear
    elseif nTy==11
        [n,wpg,pospg,N,dNdxi] = C3D10 ; %tetrahedral quadratic
    elseif nTy==21
        [n,wpg,pospg,N,dNdxi] = C3D20;  %hexhedral quadratic
    end
end
    
    

% NUMERICAL INTEGRATION
% Number of gauss points
%ngaus = 4;
%npoints=numberofintegrationpoints(nXy-1,nTy-1);




% SYSTEM RESULTING OF DISCRETIZING THE WEAK FORM
[K,f] = CreateMatrix(X(:,2:end),T(:,2:end),pospg,wpg,N,dNdxi);

% BOUNDARY CONDITIONS
nodes_inlet = input('INLET nodes (e.g. C2D4: [1 80 79 78 77 76 75 14]):');            % INLET Nodes  
nodes_outlet = input('OUTLET nodes (e.g C2D4: [247 246 10 9 8 7 6 5 ]):');          % Nodes on the boundary x=1

%nodes_y1 = [ny*(nx+1)+nx:-1:ny*(nx+1)+1]' ; % Nodes on the boundary y=1
%nodes_x0 = [(ny-1)*(nx+1)+1:-(nx+1):nx+2]'; % Nodes on the boundary x=0

%Neuman Boundary Conditions
%
% nodes on which solution is u=0
%nodesDir0 = [nodes_x0(ny-1);ndoes_inlet];
% Boundary condition matrix
%C = [nodesDir1, ones(length(nodesDir1),1); nodesDir0, zeros(length(nodesDir0),1)];
%Dirichlet Boundary Conditions
%
% INLET: nodes on which solution is u=1
nodesDir1 = [nodes_inlet]';

% OUTLET: nodes on which solution is u=0
nodesDir0 = [nodes_outlet]';

% Boundary condition matrix
C = [nodesDir1,ones(length(nodesDir1),1); nodesDir0,zeros(length(nodesDir0),1)]

ndir = size(C,1);
neq = size(f,1);
A = zeros(ndir,neq);
A(:,C(:,1)) = eye(ndir);
b = C(:,2);

% BOUNDARY CONDITIONS 
%     %Boundary Conditions where is u=1
%     %nodesDir1 = [1 14 75 76 77 78 79 80]';
%     %Boundary Conditions where is u=0
%     nodesDir0 = [4:1:12]';
%     % Boundary condition matrix
%     C = [nodesDir1, ones(length(nodesDir1),1);
%          nodesDir0, zeros(length(nodesDir0),1)];
% 
% ndir = size(C,1);
% neq  = size(f,1);
% A = zeros(ndir,neq);
% A(:,C(:,1)) = eye(ndir);
% 
% b = C(:,2);


% SOLUTION OF THE LINEAR SYSTEM
% Entire matrix
Ktot = [K A';A zeros(ndir,ndir)];
ftot = [f;b];

sol = Ktot\ftot;
Temp = sol(1:neq);
multip = sol(neq+1:end);

% POSTPROCESS
if 
else if 
geo2D_vtk2;

% figure(2), clf
% [xx,yy,sol] = MatSol(X,nx,ny,Temp);
% % surface(xx,yy,sol,'FaceColor',[1,1,1]);
% surface(xx,yy,sol);
% view([110,20])
% set(gca, 'xTick',[0:0.25:1])
% set(gca, 'yTick',[0:0.25:1])
% set(gca, 'FontSize',12)
% xlabel('x','FontSize',14);
% ylabel('y','FontSize',14);
% zlabel('u','FontSize',14);
% grid on;

