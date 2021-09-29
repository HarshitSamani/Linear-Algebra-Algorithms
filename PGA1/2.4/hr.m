function[Q,R]=hr(A)
n = size(A);
R = zeros(n);
Q = eye(n);
dummy = R;
for i=1:n
    x = A(i:n,i);
    e1 = zeros(length(x),1);
    e1(1) = 1;
    v = sign(x(1))*norm(x)*e1 + x;
    v = v/norm(v);
    A(i:n,i:n) = A(i:n,i:n) - 2*(v*v')*A(i:n,i:n);
    dummy = eye(n);
    dummy(i:n,i:n) = eye(n-i+1) - 2*(v*v');
    Q = Q*dummy';
end
R = A;
end