function[J] = pcacomp(original_img,K)
I = im2double(imread(original_img));
R = I(:,:,1); % Red channel
G = I(:,:,2); % Green channel
B = I(:,:,3); % Blue channel

% sampling of 8x8 size patches from image
sample_R = sample(R);
sample_G = sample(G);
sample_B = sample(B);

mean_R = mean(sample_R,2);
mean_G = mean(sample_G,2);
mean_B = mean(sample_B,2);

%Covariance matrix
C_R = covm(sample_R,mean_R);
C_G = covm(sample_G,mean_G);
C_B = covm(sample_B,mean_B);

%Eigenvectors in descending order of corresponding eigenvlue
V_R = sort_eig(C_R);
V_G = sort_eig(C_G);
V_B = sort_eig(C_B);

% Modify samples with K principal components
sample_R = comprs(sample_R,mean_R,V_R,K);
sample_G = comprs(sample_G,mean_G,V_G,K);
sample_B = comprs(sample_B,mean_B,V_B,K);

% Recover image from samples
R = recover(sample_R);
G = recover(sample_G);
B = recover(sample_B);
J = zeros(size(I));
J(:,:,1) = R;
J(:,:,2) = G;
J(:,:,3) = B;
end