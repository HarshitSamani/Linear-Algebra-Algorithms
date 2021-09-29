clc
clear
n = 3;
v1 = rand(n,1);
v2 = rand(n,1);
v1 = v1/norm(v1);
v2 = v2 - (v2'*v1)*v1;
v2 = v2/norm(v2);

A = 50000*v1*v1' + 2*v2*v2';
x = rand(n,1);
b = A*x;
[Q,R] = hr(A);
b = Q'*b;
y = zeros(n,1); %estimate
for i = n:-1:1
    y(i) = (b(i) - R(i,i+1:n)*y(i+1:n))/R(i,i);
end
error = norm(y-x)

disp('Housholder reflection method gives less error.')