function dy_dx = maxeyODE_position_r(t,v,A,R,omega0)
%This function houses the set of ODE for the x/y-components of the
%Maxey-Riley equation in polar form
%   This would be called in the script that solves it

dy_dx(1,1) = v(2);
dy_dx(2,1) = -omega0*v(1)*(0.75*R*omega0*cos(v(3)) + A*sin(v(3)))/2 - A*v(2);
dy_dx(3,1) = v(4);
dy_dx(4,1) = -omega0*v(1)*(0.75*R*omega0*sin(v(3)) - A*cos(v(3)))/2 - A*v(4);

end
