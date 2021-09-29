function[n] = Error(A,B);
C = A-B;
n = ((norm(C(:,:,1),'fro'))^2 + (norm(C(:,:,2),'fro'))^2 + (norm(C(:,:,3),'fro'))^2)^0.5;
end
