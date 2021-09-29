clc
clear
n = [10,50,100];
tol = 0.001;
time_j = zeros(3,1);
time_QR = zeros(3,1);
time_LU = zeros(3,1);
k = zeros(3,1);
for i=1:3
    e=ones(n(i),1);
    A=spdiags([-e 2*e -e], -1:1, n(i), n(i));
    A=full(A);
    b=rand(n(i),1);
    x0=rand(n(i),1);
    
    tic;
    [x_j,k_j,s_j]=jacobi_iter(A,b,x0,tol);
    time_j(i) = toc;
    k(i) = k_j;
    
    tic;
    [Q,R] = hr(A);
    b = Q'*b;
    
    y = zeros(n(i),1);
    for j = n(i):-1:1
        y(j) = (b(j) - R(j,j+1:n(i))*y(j+1:n(i)))/R(j,j);
    end
    time_QR(i) = toc;
end

disp('execution time for jacobi method for system size [10,50,100] respectively')
disp(time_j)
disp('execution time for QR decomp. using householder method for system size [10,50,100] respectively')
disp(time_QR)

disp('from above comparison it is easy to see that execution time for iterative methods is higher. for lower system size execution time for iterative methods are comparable to direct methods, but as system size increases execution tiome for iterative methods increases steepley as compared to direct methods.')