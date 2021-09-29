function[sample_cov] = covm(sample,mean)
N = 12288;
sum = zeros(64);
for i=1:N
    sum = sum + (sample(:,i)-mean)*(sample(:,i)-mean)';
end
sample_cov = sum/N;
end