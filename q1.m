k = 10;
m = 5;

num=[0 k k*(2+m) 2*m*k]; 
den=[1 1*k (2*k+m*k-1) 2*m*k];
sys=tf(num,den);

N=2000; 
t=linspace(0.0,10,N); 

u=ones(N,1);
y=lsim(sys,u,t);

plot(t,y,'LineWidth',1.5); grid; 
peak = findpeaks(y)
xlabel('System Response','FontSize',18);
ylabel('Output y(t)','FontSize',18); 
title('One B','FontSize',18);

