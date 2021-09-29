function[Q,R]=gs(A)
n = size(A);
R = zeros(n);
Q = R;
for j=1:n
    for i=1:j-1
        R(i,j) = Q(:,i)'*A(:,j);
        A(:,j) = A(:,j) - R(i,j)*Q(:,i);
    end
    R(j,j) = norm(A(:,j));
    Q(:,j) = A(:,j)/R(j,j);
end
end