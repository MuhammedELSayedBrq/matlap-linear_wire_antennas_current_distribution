% Define the parameters of the antenna
Io = 1;
frequency = 2.4*10^9;
lambda = ((3*10^8) / frequency);
L_small_dipole = lambda/50;
L_finite_dipole = lambda * 2;    %Will change this parameter due to desired wavelength
N = 100; 
Z_small = linspace(0, L_small_dipole/2, N);
Z2_small = linspace(-L_small_dipole/2, 0, N);

Z_finite = linspace(0, L_finite_dipole/2, N);
Z2_finite = linspace(-L_finite_dipole/2, 0, N);


% Calculate the current distribution for a small dipole
Ie_small_dipole = Io * sin(1-(2/L_small_dipole)*Z_small);
Ie2_small_dipole = Io * sin(1+(2/L_small_dipole)*Z2_small);

% Calculate the current distribution for a finite Length dipole
k = (2*pi)/lambda;
Ie_finite_dipole = Io * sin(k*(L_finite_dipole/2 - Z_finite));
Ie2_finite_dipole = Io * sin(k*(L_finite_dipole/2 + Z2_finite));

% Plot the current distribution of small dipole
figure(30);
plot( [Ie_small_dipole Ie2_small_dipole], [Z_small Z2_small] , 'LineWidth', 2);
title('Current Distribution on a Lambda/50 Dipole Antenna');
xlabel('Normalized Current');
ylabel('Antenna Length');

% Plot the current distribution of 2 * lambda length dipole
%figure;
%plot( [Ie_finite_dipole Ie2_finite_dipole], [Z_finite Z2_finite] , 'LineWidth', 2);
%title('Current Distribution on a  Lambda * 2 Dipole Antenna');
%xlabel('Normalized Current');
%ylabel('Antenna Length');
