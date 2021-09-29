clc
clear

prompt = 'enter value of n';
n = input(prompt);
A = 0.00001*eye(n) + hilb(n);
disp('(1)')
disp('GS Procedure')
[Q_g,R_g] = gs(A);
Q_g
R_g

disp('Householder Reflection')
[Q_h,R_h] = hr(A);
Q_h
R_h

disp('Givens Rotation(Proposed method)')
[Q_p,R_p] = prop(A);
Q_p
R_p

disp('(2)')
disp('error between Qt*Q and I:')
e_g = norm(Q_g'*Q_g-eye(n),'fro')
e_h = norm(Q_h'*Q_h-eye(n),'fro')
e_p = norm(Q_p'*Q_p-eye(n),'fro')

disp('(3)')
disp('error between Q*R and A:')
de_g = norm(Q_g*R_g-A,'fro')
de_h = norm(Q_h*R_h-A,'fro')
de_p = norm(Q_p*R_p-A,'fro')

disp('GS procedure gives best decomposition among these 3 methods.')