
k = 1000;
N = 1000;

num=[k]; 
den=[1 25 100 0];

sys=tf(num,den);
sys = feedback(sys,1);
t=linspace(0.0,10,N); 
u=ones(N,1);

y=lsim(sys,u,t);

plot(t,y,'LineWidth',1.5); grid; 
peak = ma
xlabel('System Response','FontSize',18);
ylabel('Output y(t)','FontSize',18); 
title('One B','FontSize',18);
