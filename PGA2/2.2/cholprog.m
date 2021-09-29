function[L]=cholprog(A)
[n,n] = size(A);
L = zeros(n);
for i=1:n
    L(i,i) = sqrt(A(i,i)-sum((L(i,1:i-1)).^2));
    if i~=n
        for j = i+1:n
            L(j,i) = (A(j,i) - L(i,1:i-1)*L(j,1:i-1)')/L(i,i);
        end
    end
end