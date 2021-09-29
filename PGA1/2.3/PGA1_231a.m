clc
clear
%2.3.1(a)

fprintf('System-1:\n')

fprintf('jacobi mehod:\n')

L1 = [0,0,0;1,0,0;2,0,0];
D1 = diag([3,7,4]);
U1 = [0,1,1;0,0,3;0,0,0];

fprintf('matrix P for jacobi:\n')
P1_j = -inv(D1)*(L1+U1);
disp(P1_j)

eig(P1_j);

fprintf('norm of P:')
n1_j = norm(P1_j);
disp(n1_j)
fprintf('it will converge\n')

k1_j = ceil(-4/log10(n1_j));
fprintf('Jacobi iterations:')
disp(k1_j)

fprintf('Gauss-Siedel method:\n')
fprintf('matrix P for Gauss-siedel:\n')
P1_g = -inv(L1+D1)*U1;
disp(P1_g)

eig(P1_g);

fprintf('norm of P:\n')
n1_g = norm(P1_g);
disp(n1_g)
fprintf('it will converge\n')

k1_g = ceil(-4/log10(n1_g));

fprintf('GS iterations:')
disp(k1_g)

fprintf('_________________________________________________________________________________________________________\n\n')

fprintf('System-2:\n')
fprintf('FOR THIS SYSTEM BOTH METHODS WILL NOT CONVERGE FOR GIVEN ORDER OF EQUATIONS, BUT AFTER PERMUTING 1ST AND 2ND ROW BOTH WILL CONVERGE.')
fprintf(' Calculation shown below is after permutation.\n\n')

fprintf('jacobi mehod:\n')

L2 = [0,0,0;1,0,0;2,1,0];
D2 = diag([9,5,4]);
U2 = [0,3,3;0,0,1;0,0,0];

fprintf('matrix P using jacobi:\n')
P2_j = -inv(D2)*(L2+U2);
disp(P2_j)

eig(P2_j);

fprintf('norm of P:')
n2_j = norm(P2_j);
disp(n2_j)

k2_j = ceil(-4/log10(n2_j));
fprintf('Jacobi iterations:')
disp(k2_j)

fprintf('Gauss-Siedel method:\n')
fprintf('matrix P for Gauss-siedel:\n')
P2_g = -inv(L2+D2)*U2;
disp(P2_g)

eig(P2_g);

fprintf('norm of P:')
n2_g = norm(P2_g);
disp(n2_g)

k2_g = ceil(-4/log10(n2_g));
fprintf('GS iterations:')
disp(k2_g)