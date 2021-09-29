function[L,U,det,inv]=qrtolu(Q,R)
[n,n] = size(Q);
b = zeros(n,1);
[L,U] = LUdecomp(Q,b);
U = U*R;

I = eye(n);
% Inverse of A
% forward substitution
z = zeros(n);
for j=1:n
    for i=1:n
        z(i,j) = I(i,j) - L(i,1:i-1)*z(1:i-1,j);
    end
end    

% back substitution
inv = zeros(n);
for j=1:n
    for i=n:-1:1
        inv(i,j) = (z(i,j) - U(i,i+1:n)*inv(i+1:n,j))/U(i,i);
    end
end
det = prod(diag(U));
end