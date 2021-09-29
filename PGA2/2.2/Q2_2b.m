clc
clear

M=1000;
mean1 = zeros(2,1);
mean2 = zeros(3,1);
sigma1 = [0.025 0.0075; 0.0075 0.007];
sigma2 = [0.025 0.0075 0.00175; 0.0075 0.007 0.00135; 0.00175 0.00135 0.00043];

[X1,Y1] = corrNRV(sigma1, mean1, M);
[X2,Y2] = corrNRV(sigma2, mean2, M);

figure(1);
subplot(1,2,1);
scatter(X1(1,:),X1(2,:),4);
xlim([-4 4]);
ylim([-4 4]);
subplot(1,2,2);
scatter(Y1(1,:),Y1(2,:),4);

figure(2);
subplot(1,2,1);
scatter3(X2(1,:),X2(2,:),X2(3,:),4);
xlim([-4 4]);
ylim([-4 4]);
zlim([-4 4]);
xlabel('x');
ylabel('y');
zlabel('z');
subplot(1,2,2);
scatter3(Y2(1,:),Y2(2,:),Y2(3,:),4);
xlim([-0.6 0.6]);
ylim([-0.3 0.3]);
zlim([-0.08 0.08]);
xlabel('x');
ylabel('y');
zlabel('z');