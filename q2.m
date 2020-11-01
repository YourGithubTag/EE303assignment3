k = 20;

num=[0 0 0 k k]; 
den=[1 6 16 32 0];
sys=tf(num,den);


bode(sys);
title('Bode Plot','FontSize',18);