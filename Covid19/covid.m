%This script is designed to solve the Maxey-Riley equation for a particle
%in the velocity field of a a source-sink pair in a constant flow
%Script name: covid

time= [0 1000];
p= 3; %Ratio of sink to source
l= 2;%Distance of sink from source (Source is located at the origin)
u0= 0;%Velocity of constant flow
g= [0 0];%Gravity is currently off

Pp= 1000;%%kg/m3 At room temperature
Pf= 1.225;%kg/m3 At room temperature
R= 2*Pf/(Pf + 2*Pp);%When R= 2/3,<2/3 or >2/3, the particle is buoyant, heavy or light respectively

for St=[1.105e-5]
    for theta=linspace(0,2*pi,20)
        x1=cos(theta)/(2*pi);
        x2=sin(theta)/(2*pi);
        v1= u0 + (x1/(x1^2 + x2^2) - p*(x1 - l)/(x2^2 + (x1 - l)^2))/(2*pi);
        v2= (x2/(x1^2 + x2^2) - p*x2/(x2^2 + (x1 - l)^2))/(2*pi);
        A= R/St;
        
        x0= [x1,v1,x2,v2]';%Intial position and velocity
        G= @(t,x) [x(2); (3*R*(((u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi))*(1/(x(1)^2 + x(3)^2) - 2*x(1)^2/(x(1)^2 + x(3)^2)^2 - p/(x(3)^2 + (x(1) - l)^2) + p*(x(1) - l)*(2*x(1) - 2*l)/(x(3)^2 + (x(1) - l)^2)^2))/(2*pi) + ((x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))*(-2*x(1)*x(3)/(x(1)^2 + x(3)^2)^2 + 2*p*(x(1) - l)*x(3)/(x(3)^2 + (x(1) - l)^2)^2))/(4*pi^2)))/2 - A*x(2) + A*(u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi)) + (1 - (3*R)/2)*g(1); x(4); (3*R*(((u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi))*(-2*x(1)*x(3)/(x(1)^2 + x(3)^2)^2 + p*x(3)*(2*x(1) - 2*l)/(x(3)^2 + (x(1) - l)^2)^2))/(2*pi) + ((x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))*(1/(x(1)^2 + x(3)^2) - 2*x(3)^2/(x(1)^2 + x(3)^2)^2 - p/(x(3)^2 + (x(1) - l)^2) + 2*p*x(3)^2/(x(3)^2 + (x(1) - l)^2)^2))/(4*pi^2)))/2 - A*x(4) + A*(x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))/(2*pi) + (1 - (3*R)/2)*g(2) ];
%Below G has no gravity
%       G= @(t,x) [x(2); (3*R*(((u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi))*(1/(x(1)^2 + x(3)^2) - 2*x(1)^2/(x(1)^2 + x(3)^2)^2 - p/(x(3)^2 + (x(1) - l)^2) + p*(x(1) - l)*(2*x(1) - 2*l)/(x(3)^2 + (x(1) - l)^2)^2))/(2*pi) + ((x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))*(-2*x(1)*x(3)/(x(1)^2 + x(3)^2)^2 + 2*p*(x(1) - l)*x(3)/(x(3)^2 + (x(1) - l)^2)^2))/(4*pi^2)))/2 - A*x(2) + A*(u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi)); x(4); (3*R*(((u0 + (x(1)/(x(1)^2 + x(3)^2) - p*(x(1) - l)/(x(3)^2 + (x(1) - l)^2))/(2*pi))*(-2*x(1)*x(3)/(x(1)^2 + x(3)^2)^2 + p*x(3)*(2*x(1) - 2*l)/(x(3)^2 + (x(1) - l)^2)^2))/(2*pi) + ((x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))*(1/(x(1)^2 + x(3)^2) - 2*x(3)^2/(x(1)^2 + x(3)^2)^2 - p/(x(3)^2 + (x(1) - l)^2) + 2*p*x(3)^2/(x(3)^2 + (x(1) - l)^2)^2))/(4*pi^2)))/2 - A*x(4) + A*(x(3)/(x(1)^2 + x(3)^2) - p*x(3)/(x(3)^2 + (x(1) - l)^2))/(2*pi) ];

        [t,x]= ode45(@(t,x) G(t,x),time,x0);
        plot(x(:,1),x(:,3))
        hold on
    end

end

xlabel('x-axis')
ylabel('y-axis')
title('Graph of Particle Trajectory')
