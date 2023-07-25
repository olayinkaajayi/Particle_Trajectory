%This script solves the given ODE for the components of the Maxey-Riley eq
%The result of this is the velocity
%Script name: Maxey_Riley_solver

time= 0:.01:5;
v0= [1,3,1]';%Initial velocities
A= 15;
R= 2/3;
x= 1;
y= 1;
omega0= 2;

[t,v]= ode45(@(t,v) maxeyODE(t,v,A,R,omega0,x,y),time,v0);

subplot(3,1,1)
plot(t,v(:,1))
xlabel('time')
ylabel('velocity')
title('x-component of the Velocity of the particle')

subplot(3,1,2)
plot(t,v(:,2))
xlabel('time')
ylabel('velocity')
title('y-component of the Velocity of the particle')

subplot(3,1,3)
plot(t,v(:,3))
xlabel('time')
ylabel('velocity')
title('z-component of the Velocity of the particle')