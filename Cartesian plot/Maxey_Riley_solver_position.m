%This script solves the given ODE for the components of the Maxey-Riley eq
%The result of this is the position
%Script name: Maxey_Riley_solver_position

time= 0:.01:10;
v0= [1,0,0,0]';%Intial position and velocity
%time= 0:.01:3;
%v0= [1,2,0,2]';%Intial position and velocity
v0z= [1,2];
A= 100;
R= 1.5;%When R= 2/3,<2/3 or >2/3, the particle is buoyant, heavy or light respectively
omega0= 10;

[t,v]= ode23(@(t,v) maxeyODE_positionXY(t,v,A,R,omega0),time,v0);
[tz,vz]= ode23(@(tz,vz) maxeyODE_positionZ(tz,vz,A),time,v0z);

[theta,r]= cart2pol(v(:,1),v(:,3));
figure(1)
polarplot(theta,r);
title('Graph of particle trajectory in polar coordinates')

figure(2)
plot(v(:,1),v(:,3))
xlabel('x-component')
ylabel('y-component')
title('Graph of particle trajectory in cartesian coordinates')

[thetaV,rV]= cart2pol(v(:,2),v(:,4));
figure(3)
plot(time,rV);
xlabel('time')
ylabel('Tangential velocity (\nu)')
title('Graph of Tangential velocity vs time')

figure(4)
plot(time,theta);
xlabel('time')
ylabel('\theta')
title('Graph of \theta vs time \omega = omega0/2')

figure(5)
subplot(3,1,1)
plot(t,v(:,2))
xlabel('time')
ylabel('velocity')
title('x-component of the Velocity of the particle in cartesian coordinate')

subplot(3,1,2)
plot(t,v(:,4))
xlabel('time')
ylabel('velocity')
title('y-component of the Velocity of the particle in cartesian coordinate')

subplot(3,1,3)
plot(tz,vz(:,2))
xlabel('time')
ylabel('velocity')
title('z-component of the Velocity of the particle in cartesian coordinate')