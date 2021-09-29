clc
clear

N = [10,50,100];

for i=1:3
    n = N(i);
    e = ones(n,1);
    A = spdiags([-e 2*e -e], -1:1, n, n);
    A = full(A);
    b = rand(n,1);
    x0 = zeros(n,1);
    tol = 0.1;
    for j=1:5
        [sol,iter(i,j),~] = jacobi_iter(A,b,x0,tol);
        tol = tol/10;
    end
end

disp('System size:n=10,  tol=[0.1, 0.01, 0.001, 0.0001, 0.00001]')
fprintf('No. of iterations:')
disp(iter(1,:))
disp('System size:n=50,  tol=[0.1, 0.01, 0.001, 0.0001, 0.00001]')
fprintf('No. of iterations:')
disp(iter(2,:))
disp('System size:n=100,  tol=[0.1, 0.01, 0.001, 0.0001, 0.00001]')
fprintf('No. of iterations:')
disp(iter(3,:))

figure(1)
plot(N,iter(:,1));
grid
hold on
plot(N,iter(:,2))
grid
plot(N,iter(:,3));
grid
plot(N,iter(:,4));
grid
plot(N,iter(:,5));
grid
hold off
xlabel('System Size');
ylabel('Iterations');
legend('0.1','0.01','0.001','0.0001','0.00001');

figure(2)
tol=[0.1,0.01,0.001,0.0001,0.00001];
semilogx(tol,iter(1,:));
grid
hold on
semilogx(tol,iter(2,:));
grid
semilogx(tol,iter(3,:));
grid
hold off
xlabel('tolerance');
ylabel('Iterations');
legend('10','50','100');


fprintf('From 1st plot, For some constant tolerance, as size of the system increases, No. of iterations increases more steepely.\n')
fprintf('From 2nd plot, For a given system size, as tolerance decreases, No.of iterations increases exponentially.')