function[X,Y] = corrNRV(cov,mean,M)
n = length(mean);
L = cholprog(cov);
X = randn(n,M);
Y = L*X + mean;
end
