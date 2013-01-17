A = [-1 4; -4 -1];
B = [11; 35]
eqPt = A^-1*B;

tSPAN = [0 10];
XYinit =[0; 0];
[t XY] = ode45(@diffeq,tSPAN,XYinit);

subplot(2,2,1)
plot(t,XY(:,1));
title('X Component Plot')
xlabel('Time')
ylabel('X Postion')
grid on

subplot(2,2,3)
plot(t,XY(:,2));
title('Y Component Plot')
xlabel('Time')
ylabel('Y Postion')
grid on

subplot(2,2,[2 4])
plot(XY(:,1),XY(:,2),eqPt(1),eqPt(2),'k*',...
    XYinit(1),XYinit(2),'r*')
title('Particle Trajectory')
xlabel('X Position')
ylabel('Y Position')
grid on
axis equal
legend('System Trajectory','Equilibrium Point','Initial Condition')



