function[x_g,k_g,s_g]=GS_iter(A,b,x0,tol)
[n,n]=size(A);
n0 = norm(A*x0-b);
x_g = zeros(n,1);
k_g = 0;
s_g = double.empty;
while (norm(A*x_g-b)/n0)>tol
    z = x_g;
    for i=1:n
        x_g(i) = (b(i)-A(i,1:i-1)*x_g(1:i-1)-A(i,i+1:n)*z(i+1:n))/A(i,i);
    end
    e = norm(x_g-z)/norm(x_g);
    s_g = [s_g,e];
    k_g = k_g+1;
end
end