clc
clear

disp('ANSWERS OF 2.3b & 2.3c')

disp('System-1:')
A = [3,1,1;1,7,3;2,0,4];
b = [5;11;5];
x0 = [0;0;0];
tol = 0.0001;
disp('jacobi:')
[x_j,k_j,s_j]=jacobi_iter(A,b,x0,tol);
disp('solution:')
disp(x_j)
disp('iterations:')
disp(k_j)
figure(1)
plot([1:1:k_j],s_j)
title('Sys-1, Jacobi')

disp('Gauss-Siedel:')
[x_g,k_g,s_g]=GS_iter(A,b,x0,tol);
disp('solution:')
disp(x_g)
disp('iterations:')
disp(k_g)
figure(2)
plot([1:1:k_g],s_g)
title('Sys-1, Gauss-Siedel')


disp('System-2:')
A = [9,3,3;1,5,1;2,1,4];
b = [15;7;7];

disp('jacobi:')
[x_j,k_j,s_j]=jacobi_iter(A,b,x0,tol);
disp('solution:')
disp(x_j)
disp('iterations:')
disp(k_j)
figure(3)
plot([1:1:k_j],s_j)
title('Sys-2, Jacobi')

disp('Gauss-Siedel:')
[x_g,k_g,s_g]=GS_iter(A,b,x0,tol);
disp('solution:')
disp(x_g)
disp('iterations:')
disp(k_g)
figure(4)
plot([1:1:k_g],s_g)
title('Sys-2, Gauss-Siedel')

disp('No of iterations required programatically is lesser compared to analytically calculated iterations.')
disp('No of iterations required for Gauss siedel method is les than Jacobi method.')
disp('Jacobi’s method Considers the updated values only from the second iteration. The first iteration is purely based on the initial approximation values provided. But Gauss Seidal Considers the updated values right from the first iiteration as well. Due to this, the rate of Convergence of Gauss Seidal is much faster than Jacobi’s method.')