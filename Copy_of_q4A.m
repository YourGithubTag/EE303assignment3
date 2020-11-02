
k = 1000;
N = 5000;

num=[k]; 
den=[1 25 100 0];

sys=tf(num,den);
sys = feedback(sys,1);
t=linspace(0.0,10,N); 
u=ones(N,1);

y=lsim(sys,u,t);

hold on
bodeplot(sys)
hold off