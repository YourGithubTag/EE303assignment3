% ELECTENG303 Assignent 3 2020
% Question 4b

clc; clf; clear;

% Calculate 1/w1 and 1/w2
mp = 0.28;
zeta = (-log(mp)) / sqrt(pi^2 + (-log(mp))^2)
phi = pi/2 - atan(zeta / (sqrt(1 - zeta^2)))
alpha = (1 - sin(phi)) / (1 + sin(phi))
omega_m = -10 * log10(1 / alpha)

% Define K and w1, w2
w1 = 0;
w2 = 0;
K = 1000;

% Create G
num = conv([0 K], [w1 1]);
den1 = conv([1 5],[1 20]);
den2 = conv([w2 1], [1 0]);
den = conv(den1, den2);
G = tf(num, den);

% Get overall unity feedback
sys = feedback(G, 1);

% Define step function and time period
N = 1000;
u = ones(N, 1);
t = linspace(0.0, 5, N);

% Calculate system response
y = lsim(sys, u, t);

% Calculate bode for the system
[mag, phase, wout] = bode(sys);
mag = squeeze(mag);
phase = squeeze(phase);

% Find Desired Frequency
wq = interp1(20*log10(mag), wout, omega_m);
%figure
%semilogx(wout, 20*log10(mag), wq, omega_m, 'r+')
%grid
%text(wq, -3.76, sprintf('\\leftarrow -3.76 dB at %.2f rad/sec',wq), 'HorizontalAlignment','left', 'VerticalAlignment','middle')

% Calculate the new w1 and w2
w1 = wq * sqrt(alpha);
w2 = wq / sqrt(alpha);
w1 = 1 / w1;
w2 = 1 / w2;

% Create G
num = conv([0 K], [w1 1]);
den1 = conv([1 5],[1 20]);
den2 = conv([w2 1], [1 0]);
den = conv(den1, den2);
G = tf(num, den);

% Get overall unity feedback
sys = feedback(G, 1);

% Define step function and time period
N = 1000;
u = ones(N, 1);
t = linspace(0.0, 5, N);

% Calculate system response
y = lsim(sys, u, t);

stepinfo(sys)

% Plot
hold on;
grid on;
plot(t, y, 'r');
xlabel("Time in Seconds");
ylabel("Output Response y(t)");
title("Question 4b Step Response");