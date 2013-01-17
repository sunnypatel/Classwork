%% Lab 4- Parth Panchal 1/27/2011
clear,clc

%% Solution
A = [-0.1 0.0075; 0.1 -0.2]; B = [-1.5; -3];
eqPt = A^-1*B

tSPAN = [0 100];
XYinit = [55; 26];
[t XY] = ode45(@Qdot,tSPAN,XYinit); 
 
%% Results
subplot(2,2,1)
plot(t,XY(:,1))
title('Q1(t) Component Plot')
xlabel('Time'), ylabel('Q1(t)'), grid on  
  
subplot(2,2,3)
plot(t,XY(:,2))
axis equal
title('Q2(t) Component Plot')
xlabel('Time')
ylabel('Q2(t)'), grid on

subplot(2,2,[2 4])
plot(XY(:,1),XY(:,2),eqPt(1,:),eqPt(2,:),'g-*',XYinit(1,:),XYinit(2,:),'r-*')
grid on
axis equal
ylabel('Q2(t)')
xlabel('Q1(t)')
title('Particle Trajectory')
legend('System Phase Potrait',['Equilibrium Point = ' '(' num2str(eqPt(1,:)) ',' num2str(eqPt(2,:)) ')' ], ['Initial Condition = ' '(' num2str(XYinit(1,:)) ',' num2str(XYinit(2,:)) ')' ])
