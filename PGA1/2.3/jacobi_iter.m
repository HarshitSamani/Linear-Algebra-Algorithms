function[x_j,k_j,s_j]=jacobi_iter(A,b,x0,tol)
[n,n]=size(A);
x_j = zeros(n,1);
k_j = 0;
n0 = norm(A*x0-b);
s_j = double.empty;
while (norm(A*x_j-b)/n0)>tol
    z = x_j;
    for i=1:n
        x_j(i) = (b(i)-A(i,1:n)*z(1:n)+A(i,i)*z(i))/A(i,i);
    end
    e = norm(x_j-z)/norm(x_j);
    s_j = [s_j,e];
    k_j = k_j+1;
end
end
