function dy_dx = maxeyODE_positionXY(t,v,A,R,omega0)
%This function houses the set of ODE for the x/y-components of the Maxey-Riley equation
%   This would be called in the script that solves it

dy_dx(1,1) = v(2);
dy_dx(2,1) = -A*v(3)*omega0/2 - (3/8)*R*v(1)*omega0^2 - A*v(2);
dy_dx(3,1) = v(4);
dy_dx(4,1) = A*v(1)*omega0/2 - (3/8)*R*v(3)*omega0^2 - A*v(4);

end
