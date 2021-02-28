%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%

clc;
close all;
clear variables;

DEF_PhysicalConstants;

% standard model
model(1).Om0 = 0.31;
model(1).Or0 = 0.0;
model(1).Ol0 = 0.69;

model(2).Om0 = 0.31;
model(2).Or0 = 0.0;
model(2).Ol0 = 0.0;

model(3).Om0 = 1.0;
model(3).Or0 = 0.0;
model(3).Ol0 = 0.0;

model(4).Om0 = 5.0;
model(4).Or0 = 0.0;
model(4).Ol0 = 0.0;

fig = figure ('PaperType', 'a5', 'PaperOrientation', 'landscape');

for m = 1:numel (model)
  t0 = FCT_Age (H0InvGyr, model(m).Om0, model(m).Or0, model(m).Ol0);
  
  syseqn = @(t, X) ODE_Acceleration (t, X, H0InvGyr, model(m).Om0, model(m).Or0, model(m).Ol0);

  timespan = [t0 100];
  X0 = [1 H0InvGyr];
  [tfwd, Xfwd] = ode45 (syseqn, timespan, X0);

  timespan = [t0 0];
  X0 = [1 H0InvGyr];
  [tbwd, Xbwd] = ode45 (syseqn, timespan, X0);
  tbwd = flip (tbwd);
  Xbwd = flip (Xbwd);

  if min ([Xbwd(:,2); Xfwd(:,2)]) > 0
    switch sign (-1 * (1 - model(m).Om0 - model(m).Or0 - model(m).Ol0))
      case -1
        kstr = 'k < 0';
      case +1
        kstr = 'k > 0';
        otherwise
        kstr = 'k = 0';
    end
    plotname = sprintf ('\\Omega_{m,0} = %.2f  \\Omega_{\\Lambda,0} = %.2f  %s', model(m).Om0, model(m).Ol0, kstr);
    semilogy ([tbwd; tfwd], [Xbwd(:,2); Xfwd(:,2)], 'LineWidth', 1.5, 'DisplayName', plotname);
    hold on;
  end
end

grid on;
xlabel ('t [Gyr]');
ylabel ('dx/dt [1/Gyr]');
legend ('show', 'Location', 'northwest');

print (fig, 'figures/expansionrate', '-dpdf', '-r300', '-bestfit');
