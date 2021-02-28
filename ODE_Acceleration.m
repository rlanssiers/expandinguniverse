%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%
%  dXdt = ODE_Acceleration (t, X, H0, Om0, Or0, Ol0)
%
%  t       - time
%  X(1)    - relative scale factor
%  X(2)    - first order time derivative of the relative scale factor
%  H0      - Hubble parameter at present time
%  Om0     - matter density parameter at present time
%  Or0     - radiation density parameter at present time
%  Ol0     - lambda density parameter at present time
%
%  dXdt(1) - first order time derivative of the relative scale factor
%  dXdt(2) - second order time derivative of the relative scale factor
%

function dXdt = ODE_Acceleration (t, X, H0, Om0, Or0, Ol0)
  dXdt = zeros (size (X));
  dXdt(1) = X(2);
  dXdt(2) = - H0^2 * (Or0 / X(1)^3 + 0.5 * Om0 / X(1)^2 - Ol0 * X(1));
end
