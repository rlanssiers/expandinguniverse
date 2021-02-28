%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%

clc;
close all;
clear variables;

DEF_PhysicalConstants;

t0 = 13.8;

t = linspace (0, 30);
xr = (t ./ t0).^(1/2);
xm = (t ./ t0).^(2/3);
xl = exp (H0InvGyr .* (t - t0));

fig = figure ('PaperType', 'a5', 'PaperOrientation', 'landscape');

plot (t, xr, 'LineWidth', 1.5, 'DisplayName', 'radiation only');
hold on;
plot (t, xm, 'LineWidth', 1.5, 'DisplayName', 'matter only');
plot (t, xl, 'LineWidth', 1.5, 'DisplayName', 'lambda only');

grid on;
xlabel ('t [Gyr]');
ylabel ('x [-]');
legend ('show', 'Location', 'northwest');

print (fig, 'figures/scalefactorsimplified', '-dpdf', '-r300', '-bestfit');
