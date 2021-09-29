function[det,inv,L,U,P]=LUpartial(A)
[n,n] = size(A);
L = eye(n);
P = L;
U = A;
p = 0;      %permutation counter
for i=1:n-1
    [~,max_ind] = max(abs(U(i:n,i))); %finding index of the max absolute value from subdiagonal entries of ith col.
    if max_ind~=1
        max_ind = max_ind+i-1;     
        
        dummy = U(max_ind,i:n);
        U(max_ind,i:n) = U(i,i:n);      % interchange 
        U(i,i:n) = dummy;
    
        dummy = L(max_ind,1:i-1);
        L(max_ind,1:i-1) = L(i,1:i-1);  % interchange 
        L(i,1:i-1) = dummy;
    
        dummy = P(max_ind,:);
        P(max_ind,:) = P(i,:);          % interchange 
        P(i,:) = dummy;
        
        p = p + 1;
    end
    
    for j=i+1:n
        L(j,i)=U(j,i)/U(i,i);
        U(j,i:n)=U(j,i:n) - L(j,i)*U(i,i:n);
    end   
end

% Inverse of A
% forward substitution
z = zeros(n);
for j=1:n
    for i=1:n
        z(i,j) = P(i,j) - L(i,1:i-1)*z(1:i-1,j);
    end
end    

% back substitution
inv = zeros(n);
for j=1:n
    for i=n:-1:1
        inv(i,j) = (z(i,j) - U(i,i+1:n)*inv(i+1:n,j))/U(i,i);
    end
end
% Determinant
det = (-1)^p*prod(diag(U));