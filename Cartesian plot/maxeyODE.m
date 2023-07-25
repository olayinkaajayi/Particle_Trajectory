function dy_dx = maxeyODE(t,v,A,R,omega0,x,y)
%This function houses the set of ODE for the components of the Maxey-Riley equation
%   This would be called in the script that solves it

dy_dx(1,1) = -A*v(1) - omega0*(0.75*R*x*omega0 + A*y)/2;
dy_dx(2,1) = -A*v(2) - omega0*(0.75*R*y*omega0 - A*x)/2;
dy_dx(3,1) = -A*v(3);

end
