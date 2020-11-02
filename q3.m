Td = 0.5;

num=[0.0005*140625]; 
den = conv([1 0.005], [1 2.67]);
den = conv(den, [1 10]);

sys=tf(num,den, 'InputDelay', Td);
sys = feedback(sys, 1);

nyquist(sys);
figure;
hold on
bode(sys);
hold off