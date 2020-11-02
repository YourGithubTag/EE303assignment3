 clc; clf; clear;

v = -5:0.01:5;  % plotting range from -5 to 5
[k, m] = meshgrid(v);  % get 2-D mesh for x and y

cond1 = 2.*k + k.*m - 2.*m > 1;  % check conditions for these values
cond2 = k > 0;
cond3 = 2.*m.*k > 0;

cond1 = double(cond1);  % convert to double for plotting
cond2 = double(cond2);
cond3 = double(cond3);

cond1(cond1 == 0) = NaN;  % set the 0s to NaN so they are not plotted
cond2(cond2 == 0) = NaN;
cond3(cond3 == 0) = NaN;

cond = cond1.*cond2;  % multiply the two condaces to keep only the common points
cond = cond.*cond3;

s = surf(k,m,cond);
   % change to top view

set(s,'edgecolor','none','facecolor',[0 0.4470 0.7410]) %turn off vertices and change colour to blue

title('Plot of stable values for k and m');
xlabel('k');
ylabel('m');