clear
clc

disp('For 10x10 Toeplitz matrix:')
row1 = [2,-1,0,0,0,0,0,0,0,0];
A1 = toeplitz(row1);
b1 = [11;0;0;0;0;0;0;0;0;0];
x0 = zeros(10,1);
tol = 0.0001;

disp('jacobi:')
[x1_j,k1_j,~]=jacobi_iter(A1,b1,x0,tol);
disp('solution')
disp(x1_j)
disp('iterations')
disp(k1_j)

disp('Gauss-Siedel:')
[x1_g,k1_g,~]=GS_iter(A1,b1,x0,tol);
disp('solution')
disp(x1_g)
disp('iterations')
disp(k1_g)

disp('For given 10x10 toeplitz matrix, P can be given as below:')

disp('jacobi method:')
disp('P = toeplitz([0,1/2,0,0,0,0,0,0,0,0])')
P = toeplitz([0,1/2,0,0,0,0,0,0,0,0]);
spectral_rad = max(abs(eig(P)));
fprintf('since, spectral radius of P is %f<1, it converges.\n',spectral_rad)
fprintf('\n')

disp('Gauss-Siedel method:')
disp('L+D = toeplitz([2,-1,0,0,0,0,0,0,0,0],[2,0,0,0,0,0,0,0,0,0])') 
LD = toeplitz([2,-1,0,0,0,0,0,0,0,0],[2,0,0,0,0,0,0,0,0,0]);
disp('U = toeplitz([0,0,0,0,0,0,0,0,0,0],[0,-1,0,0,0,0,0,0,0,0])')
U = toeplitz([0,0,0,0,0,0,0,0,0,0],[0,-1,0,0,0,0,0,0,0,0]);
disp('P = -inv(L+D)*U')
P = -inv(LD)*U;
spectral_rad = max(abs(eig(P)));
fprintf('since,spectral radius of P is %f<1, it converges.\n',spectral_rad)

fprintf('guess of the solution:,[10,9,8,7,6,5,4,3,2,1]\n\n')

disp('-------------------------------------------------------------------------------')

disp('For 20x20 Toeplitz matrix:')

row2 = [2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
A2 = toeplitz(row2);
b2 = [21;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];
x0 = zeros(20,1);
disp('jacobi:')
[x2_j,k2_j,~]=jacobi_iter(A2,b2,x0,tol);
disp('solution')
disp(x2_j)
disp('iterations')
disp(k2_j)

disp('Gauss-Siedel:')
[x2_g,k2_g,~]=GS_iter(A2,b2,x0,tol);
disp('solution')
disp(x2_g)
disp('iterations')
disp(k2_g)


disp('For given 20x20 toeplitz matrix, P can be given as below:')
disp('jacobi method:')
disp('P = toeplitz([0,1/2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])')
P = toeplitz([0,1/2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
spectral_rad = max(abs(eig(P)));
fprintf('since, spectral radius of P is %f<1, it converges.\n',spectral_rad)
fprintf('\n')

disp('Gauss-Siedel method:')
disp('L+D = toeplitz([2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])') 
LD = toeplitz([2,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
disp('U = toeplitz([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])')
U = toeplitz([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
disp('P = -inv(L+D)*U')
P = -inv(LD)*U;
spectral_rad = max(abs(eig(P)));
fprintf('since,spectral radius of P is %f<1, it converges.\n',spectral_rad)
fprintf('\n')

fprintf('guess of the solution:[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]')