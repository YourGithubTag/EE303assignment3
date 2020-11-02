k = 35;

num=[0 0 0 k k]; 
den=[1 6 16 32 0];
sys=tf(num,den);

Ts = feedback(sys,1);

bode(Ts);
title('Bode Plot','FontSize',18);