function[x]=cmplx(A,b)
n=length(b);
A_r = real(A);
A_c = imag(A);
b_r = real(b);
b_c = imag(b);
A_m = [A_r -A_c; A_c A_r]; %modifying the system by taking real and imag. part as seperate variables
b_m = [b_r;b_c];
[L,U,x]=LUdecomp(A_m,b_m);
TF = isnumeric(x);
if TF == 1
    x = complex(x(1:n),x(n+1:2*n));
else
    x = 'LU decomp. does not exist';
end
fc = 2/3*(2*n)^3;          %since we are working with system size:2*n
disp('flop counts:')
disp(fc)
end
