function[Q,R]=prop(A)
[n,n] = size(A);
Q = eye(n);
for j=1:n-1
    for i=n:-1:j+1
        a = A(i-1,j);
        b = A(i,j);
        r = hypot(a,b);         
        c = a/r;                %c=cos(theta)
        s = b/r;                %s=sin(theta)
        G = eye(n);             
        G(i-1,i-1) = c;         %To construct Givens Rotation matrix 
        G(i,i) = c;
        G(i-1,i) = s;
        G(i,i-1) = -s;
        A = G*A;                %To make A(i,j)=0
        Q = Q*G';
    end
end
R = A;
end