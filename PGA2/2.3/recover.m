function[img] = recover(sample)
img = zeros(768,1024);
k=1;
for i=1:8:768
    for j=1:8:1024
        img(i:i+7,j:j+7) = reshape(sample(:,k),[8,8]);
        k = k+1;
    end
end