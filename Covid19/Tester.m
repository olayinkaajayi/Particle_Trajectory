%This script is designed to solve the Maxey-Riley equation for a particle
%in the velocity field of a a source-sink pair in a constant flow
%Script name: Tester

time= 0:0.01:10;
w= 10;%Omega
R= 1.5;
A= 100;

x0= [1,0,0,0]';%Intial position and velocity
G= @(t,x) [x(2); -3/8*R*w^2*x(1) - A*x(2) - 1/2*A*w*x(3) ; x(4) ; -3/8*R*w^2*x(3) - A*x(4) + 1/2*A*w*x(1) ];
[t,x]= ode23(@(t,x) G(t,x),time,x0);



plot(x(:,1),x(:,3))

