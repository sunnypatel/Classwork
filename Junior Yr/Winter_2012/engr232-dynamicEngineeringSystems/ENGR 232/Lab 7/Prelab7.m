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