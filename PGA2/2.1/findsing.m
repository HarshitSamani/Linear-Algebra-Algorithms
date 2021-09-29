function sing_val = findsing(A,iter)
[n,n]=size(A);
B = A'*A;
B = sym2tri(B);
eig = trieig(B,iter);
sing_val = sqrt(eig);
end