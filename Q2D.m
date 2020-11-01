k = 25;
k2 = 30;

input = ones(1,1000);
t = linspace(0,20,1000);

num=[0 0 0 k k]; 
den=[1 6 16 32 0];
sys=tf(num,den);

num2=[0 0 0 k2 k2]; 
sys2=tf(num2,den);

Ts = feedback(sys,1);
Ts2 = feedback(sys2,1);

output1 = lsim(Ts,input,t);
output2 = lsim(Ts2,input,t);
plot(t,output1);

hold on
plot(t,output2);

hold off

title('Plot','FontSize',18);