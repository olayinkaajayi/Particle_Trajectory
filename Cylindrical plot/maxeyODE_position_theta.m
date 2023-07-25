function dy_dx = maxeyODE_position_theta(t,v,A,R,omega0,r)
%This function houses the set of ODE for the x/y-components of the
%Maxey-Riley equation in polar form
%   This would be called in the script that solves it

dy_dx(1,1) = v(1);
dy_dx(2,1) = -omega0*r*(0.75*R*omega0*cos(v(1)) + A*sin(v(1)))/2 - A*v(2);

end
