function[lambda,max_eig]=trieig(A,iter)
max_eig = double.empty;
for i=1:iter
    [Q,R] = prop(A);
    A = R*Q;
    max_eig = [max_eig, max(diag(A))];
end
lambda = diag(A);
end