clear 
clc
K = 1000;
lead = 0.01;
num = [K*lead K];
%num = conv(lead, 1000);
v = conv([1 5], [1 20]);
den = conv(v, [1 0]);
G = tf(num, den);
sys = feedback(G, 1);
overshoot = stepinfo(sys).Overshoot;
tic 
while (overshoot > 10) 
    lead = lead + 0.0001;
    num = [K*lead K];
    v = conv([1 5], [1 20]);
    den = conv(v, [1 0]);
    G = tf(num, den);
    sys = feedback(G, 1);
    overshoot = stepinfo(sys).Overshoot;
end 
toc
disp(lead)

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