function[B]=sym2tri(A)
n = size(A);
B = zeros(n);
for i=1:n-2
    x = A(i+1:n,i);
    e1 = zeros(length(x),1);
    e1(1) = 1;
    v = sign(x(1))*norm(x)*e1 + x;
    v = v/norm(v);
    A(i+1:n,i:n) = A(i+1:n,i:n) - 2*(v*v')*A(i+1:n,i:n);
    A(1:n,i+1:n) = A(1:n,i+1:n) - 2*A(1:n,i+1:n)*v*v';
end
B = A;
end