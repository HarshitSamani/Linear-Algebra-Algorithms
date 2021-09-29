function[L,U,x]=LUdecomp(A,b)
[n,n] = size(A);
L = eye(n);
U = A;
for i=1:n-1
    for j=(i+1):n
        t=U(j,i)/U(i,i);
        if t==Inf
            break
        end
        U(j,i:n)=U(j,i:n) - t*U(i,i:n);
        L(j,i) = t;
    end
    if t==Inf
        break
    end
end
if t==Inf
    U = ('Does not exist');
    L = ('Does not exist');
    x = ('Can not solve by this method');
    
else
    % forward substitution
    z = zeros(n,1);
    for i=1:n
        z(i) = b(i) - L(i,1:i-1)*z(1:i-1);
    end
    
    % back substitution
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = (z(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
    end
end
    
    