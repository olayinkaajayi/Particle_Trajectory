function dy_dx = maxeyODE_positionZ(t,v,A)
%This function houses the set of ODE for the z-components of the Maxey-Riley equation
%   This would be called in the script that solves it

dy_dx(1,1) = v(1);
dy_dx(2,1) = -A*v(2);

end
