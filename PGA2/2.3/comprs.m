function[compressed] = comprs(sample,mean,eig_vec,K)
compressed = zeros(size(sample));
for i=1:12288
    sum = zeros(64,1);
    for k=1:K
       sum = sum + ((sample(:,i)-mean)'*eig_vec(:,k))*eig_vec(:,k);
    end
    compressed(:,i) = mean + sum;
end