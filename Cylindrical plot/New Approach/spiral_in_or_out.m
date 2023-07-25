%Script name: spiral_in_or_out

A= 100;
R= .5;
w0= 5;
t= 0:0.01:20;
lambda1= -A/2 + sqrt(A*A/4 + (1 - 1.5*R)*w0*w0);
lambda2= -A/2 - sqrt(A*A/4 + (1 - 1.5*R)*w0*w0);

r= exp(lambda1*t) + exp(lambda2*t);
plot(t,r)
xlabel('time')
ylabel('r(t)')
title('Graph of r(t) vs t for R< 2/3')