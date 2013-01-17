%% Lab 7 Prelab - Krishnateja Pemmaraju, Section 062, 8/6/2011

%% Problem Statement
%In this lab assignment, the concept was modeling two bungie cord designs.
% Using two variables, we wanted to see if the differential
% equations could produce reliable results, in terms of safety
% requirements.

%% Function - pl71

type pl71

%% Function - pl72

type pl72

%% Solution Code

t = [0 120];
y0 = 200;
y0prime = 0;
Yinit = [y0;y0prime];

[t1 Y1] = ode45(@pl71,t,Yinit);
[t2 Y2] = ode45(@pl72,t,Yinit);

subplot(2,1,1),plot(t1,Y1(:,1),'r')
line([0; 120],[0; 0]);
axis([0 120 -50 200])
grid on;
title('Bungee Cord Design #1');
xlabel('Elapsed Time'),ylabel('Vertical Position');
legend('Jumper Position','Ground Level')

subplot(2,1,2),plot(t2,Y2(:,1),'r')
line([0; 120],[0; 0]);
axis([0 120 -50 200])
grid on; 
title('Bungee Cord Design #2');
xlabel('Elapsed Time'),ylabel('Vertical Position');
legend('Jumper Position','Ground Level')

%% Conclusion
% After analyzing the plots, the first design is the safest. To make design
% 2 also safe, some important properties of the design would have to change
% as mentioned above.