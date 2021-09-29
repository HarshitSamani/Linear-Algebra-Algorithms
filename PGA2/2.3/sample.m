function[sampled] = sample(img)
[M,N]=size(img);
sampled = zeros(64,M*N/64);
k=1;
for i=1:8:M
    for j=1:8:N
        sampled(:,k)= reshape(img(i:i+7,j:j+7),[64,1]);
        k = k+1;
    end
end