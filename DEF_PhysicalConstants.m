%
%  Code written by Rony Lanssiers in 2017-2021.
%  This work can be shared and adapted as long
%  as appropriate credit is given (CC BY 4.0).
%

global H0 H0Conv H0InvGyr c;

H0 = 68; % km/s/Mpc

% 1 Mpc = 3.08567758 * 10^19 km
% 1 Gyr = 3600 * 24 * 365 * 10^9 s
H0Conv = (3600 * 24 * 365 * 1E9) / (3.08567758 * 1E19);

H0InvGyr = H0 * H0Conv; % 1/Gyr

c = 2.99792458E5; % km/s
