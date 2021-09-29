clc
clear
img = 'watch.bmp';
I = im2double(imread(img));

J = pcacomp(img,5);
figure; imshow(J); title('Compressed image, K=5');
fprintf('error for K=5: %d\n',Error(I,J))

J = pcacomp(img,10);
figure; imshow(J); title('Compressed image, K=10');
fprintf('error for K=10: %d\n',Error(I,J))

J = pcacomp(img,20);
figure; imshow(J); title('Compressed image, K=20');
fprintf('error for K=20: %d\n',Error(I,J))

e = double.empty;
for K=1:64
    J = pcacomp(img,K);
    e = [e , Error(I,J)];
end
figure;
plot([1:1:64],e)
disp('Error monotonically decreases as K increases.')