function dy_dx = maxeyODE_position_r(t,v,A,R,omega0)
%This function houses the set of ODE for the x/y-components of the
%Maxey-Riley equation in polar form
%   This would be called in the script that solves it


dy_dx(1,1) = v(2);
dy_dx(2,1) = -(3/8)*R*omega0^2*v(1) - A*v(2) + v(1)*(v(4))^2;
dy_dx(3,1) = v(4);
dy_dx(4,1) = A*0.5*omega0 - A*v(4) - 2*v(2)*v(4)/v(1) ...
    + (3/4)*R*omega0*v(2)/v(1);

end
