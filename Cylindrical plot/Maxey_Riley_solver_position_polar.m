%This script solves the given ODE for the components of the Maxey-Riley eq
%The result of this is the position
%Script name: Maxey_Riley_solver_position_polar

time= 0:.001:10;
v0_r= [1,2,0,5]';%Intial position and velocity
v0_z= [1,2]';%Intial position and velocity
A= 100;
R= 2/3;
omega0= 10;

[t,v]= ode23(@(t,v) maxeyODE_position_r(t,v,A,R,omega0),time,v0_r);
[tz,vz]= ode23(@(tz,vz) maxeyODE_positionZ(tz,vz,A),time,v0_z);

figure(1)
polarplot(v(:,3),v(:,1))
title('Trajectory of the particle in polar coordinates')

figure(2)
subplot(3,1,1)
plot(t,v(:,2))
xlabel('time')
ylabel('radial velocity (\nu)')
title('radial Velocity of the particle')

subplot(3,1,2)
plot(t,v(:,4))
xlabel('time')
ylabel('angular velocity (\omega)')
title('angular Velocity of the particle')

subplot(3,1,3)
plot(tz,vz(:,2))
xlabel('time')
ylabel('velocity')
title('z-component of the Velocity of the particle')