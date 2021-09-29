function[Q,R]=prop(A)
[n,n] = size(A);
Q = eye(n);
for j=1:n-1
    a = A(j,j);
    b = A(j+1,j);
    r = hypot(a,b);
    c = a/r;
    s = b/r;
    G = eye(n);
    G(j,j) = c;
    G(j+1,j+1) = c;
    G(j,j+1) = s;
    G(j+1,j) = -s;
    A = G*A;
    Q = Q*G';
end
R = A;
end