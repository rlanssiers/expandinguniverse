%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%

clc;
close all;
clear variables;

DEF_PhysicalConstants;

model(1).Om0 = 0.1;
model(1).Or0 = 0.0;
model(1).Ol0 = 0.9;

% standard model
model(2).Om0 = 0.31;
model(2).Or0 = 0.0;
model(2).Ol0 = 0.69;

model(3).Om0 = 0.1;
model(3).Or0 = 0.0;
model(3).Ol0 = 0.0;

model(4).Om0 = 0.5;
model(4).Or0 = 0.0;
model(4).Ol0 = 0.5;

model(5).Om0 = 1.0;
model(5).Or0 = 0.0;
model(5).Ol0 = 0.0;

model(6).Om0 = 1.9;
model(6).Or0 = 0.0;
model(6).Ol0 = 0.0;

fig = figure ('PaperType', 'a5', 'PaperOrientation', 'landscape');

H0 = linspace (40, 100, 30);
for m = 1:numel (model)
  T0 = FCT_Age (H0Conv .* H0, model(m).Om0, model(m).Or0, model(m).Ol0);
  switch sign (-1 * (1 - model(m).Om0 - model(m).Or0 - model(m).Ol0))
    case -1
      kstr = 'k < 0';
    case +1
      kstr = 'k > 0';
    otherwise
      kstr = 'k = 0';
  end
  plotname = sprintf ('\\Omega_{m,0} = %.1f  \\Omega_{\\Lambda,0} = %.1f  %s', model(m).Om0, model(m).Ol0, kstr);
  plot (H0, T0, 'LineWidth', 1.5, 'DisplayName', plotname);
  hold on;
end

plot (67.74, 13.799, 'k*', 'HandleVisibility', 'off');
set (text (67.74, 13.799 + 0.5, 'Planck'), 'Rotation', 90);

plot (70.0, 13.74, 'k*', 'HandleVisibility', 'off');
set (text (70.0, 13.74 + 0.5, 'WMAP'), 'Rotation', 90);

grid on;
axis ([40 100 5 25]);
xlabel ('H_0 [km/s/Mpc]');
ylabel ('t_0 [Gyr]');
legend ('show');

print (fig, 'figures/age', '-dpdf', '-r300', '-bestfit');
