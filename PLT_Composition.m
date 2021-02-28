%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%

clc;
close all;
clear variables;

fig = figure ('PaperType', 'a5', 'PaperOrientation', 'landscape');

piedata = [4.8 26.2 69.0];
pielabels = {'4.8%', '26.2%', '69.0%'};
pie (piedata, pielabels);

legendlabels = {'baryonic matter', 'dark matter', 'dark energy'};
legend (legendlabels, 'Location', 'southoutside', 'Orientation', 'horizontal');

print (fig, 'figures/composition', '-dpdf', '-r300', '-bestfit');
