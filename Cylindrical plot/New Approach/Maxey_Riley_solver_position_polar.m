%This script solves the given ODE for the components of the Maxey-Riley eq
%The result of this is the position
%Script name: Maxey_Riley_solver_position_polar
%Author: Ajayi Olayinka Josiah

char_omega= pi/10;%Characteristic angular velocity
L= 10;%m Characteristic length
U= char_omega*L/2;%Characteristic linear velocity
time= [0:.01:250]*U/L;
v0= [L,0,0,3]';%Intial position and velocity
rho_f= 917;%kg/m3 : fluid density at room temperature
rho_p= 1000;%kg/m3 : particle density at room temperature
a= 12e-3;%m : radius of particle
nu= 5.8e-5;%m2/s : kinematic viscosity
R= 2/3;%2*rho_f/(rho_f + 2*rho_p);%When R= 2/3,<2/3 or >2/3, the
%particle is buoyant, heavy or light respectively
Re= U*L/nu;%Reynolds number
St= (2/9)*(a/L)^2*Re;%Stokes number
A= R/St;%Stokes drag
omega0= (0.6*pi)/char_omega;%angular velocity

%This is the solution to the Maxey-Riley equation
[t,v]= ode23(@(t,v) maxeyODE_position_r(t,v,A,R,omega0),time,v0);

figure(1)
polarplot(v(:,3),v(:,1))
title('Trajectory of the drop of oil in polar coordinates')

figure(2)
subplot(2,1,1)
plot(t,v(:,2))
xlim([0 1])
xlabel('time')
ylabel('radial velocity (dr/dt)')
title('Radial Velocity of the drop of oil while the pool is stirred')

subplot(2,1,2)
axis tight
plot(t,v(:,4))
xlim([0 1])
xlabel('time')
ylabel('angular velocity (d\theta/dt)')
title('angular Velocity of the drop of oil while the pool is stirred')
