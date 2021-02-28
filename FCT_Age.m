%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%
%  t0 = FCT_Age (H0, Om0, Or0, Ol0)
%
%  H0  - Hubble parameter at present time
%  Om0 - matter density parameter at present time
%  Or0 - radiation density parameter at present time
%  Ol0 - lambda density parameter at present time
%
%  t0  - present time, i.e. the age of the universe
%

function t0 = FCT_Age (H0, Om0, Or0, Ol0)
  t0 = zeros (size (H0));
  for i = 1:numel (H0)
    fct = @(x) 1 ./ (H0(i) .* sqrt (Or0 ./ x.^2 + Om0 ./ x.^1 + Ol0 .* x.^2 + 1 - Or0 - Om0 - Ol0));
    t0(i) = integral (fct, 0, 1);
  end
end
