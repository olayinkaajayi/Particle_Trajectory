%This script solves the given ODE for the components of the Maxey-Riley
%equation in polar form
%The result of this is the velocity
%Script name: Maxey_Riley_solver_polar
close all
time= 0:.01:5;
v0= 2*[1,1,1]';%Initial velocities
A= 15;
R= 2/3;
theta= pi/4;
r= 1;
omega0= 4;

[t,v]= ode45(@(t,v) maxeyODE_polar(t,v,A,R,omega0,theta,r),time,v0);

subplot(3,1,1)
plot(t,v(:,1))
xlabel('time')
ylabel('velocity')
title('r-component of the Velocity of the particle')

subplot(3,1,2)
plot(t,v(:,2))
xlabel('time')
ylabel('velocity')
title('theta-component of the Velocity of the particle')

subplot(3,1,3)
plot(t,v(:,3))
xlabel('time')
ylabel('velocity')
title('z-component of the Velocity of the particle')