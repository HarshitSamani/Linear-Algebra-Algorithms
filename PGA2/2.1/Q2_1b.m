clc
clear
A = [3,3,4;3,7,6;4,6,10];
A = sym2tri(A);
iter= 10;
[lambda,iter_max] = trieig(A,iter);
true_max = max(eig(A));
e = double.empty;
for i=1:iter
    e = [e,norm(iter_max(i)-true_max)];
end
plot([1:iter],e)
xlabel('No. of iterations')
ylabel('Error')
disp('Per iteration Complexity: O(n)')

