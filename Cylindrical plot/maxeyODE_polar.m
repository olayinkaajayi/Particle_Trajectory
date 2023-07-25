function dy_dx = maxeyODE_polar(t,v,A,R,omega0,theta,r)
%This function houses the set of ODE for the components of the Maxey-Riley
%equation in cylindrical polar form
%   This would be called in the script that solves it

dy_dx(1,1) = -A*v(1) - r*omega0*(0.75*R*omega0*cos(theta) + A*sin(theta))/2;
dy_dx(2,1) = -A*v(2) - r*omega0*(0.75*R*omega0*sin(theta) - A*cos(theta))/2;
dy_dx(3,1) = -A*v(3);

end

