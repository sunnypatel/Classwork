%% Lab 3 Prelab - Krishnateja Pemmaraju, Section 62, 7/6/2011

%% Problem Statement
% Our goal is to see how a numerical differential equation solver works on
% a given differential equation instead of the analytical solution that we
% get through calculus.

%% Function - L3PL_a

type L3PL_a

%% Function - L3PL_b

type L3PL_b

%% Solution Code

tSPAN = [0 200];
hInit = 3;

[T Y]=ode45(@L3PL_a,tSPAN,hInit);

subplot(2,2,1)
plot(T,Y)
xlabel('Time Output from ODE45 (T)')
ylabel('ODE45 Solution (Y)')
grid on
title('ODE45 Solution, T_E approximately 131 sec')


tSPAN = [0 1000];
hInit = 3;

[T2 Y2]=ode45(@L3PL_a,tSPAN,hInit);

subplot(2,2,2)
plot(T2,Y2)
xlabel('Time Output from ODE45 (T)')
ylabel('ODE45 Solution (Y)')
grid on
title('ODE45 Solution, t extended up to 1,000 sec')


Y_a = L3PL_b(T2);
subplot(2,2,3)
plot(T2,Y2,'b',T2,Y_a,'ro')
xlabel('Time Output from oDE45 (T)')
ylabel('Solution Values')
grid on
legend('ODE45 Solution','Analytical Solution')


subplot(2,2,3)
plot(T2,Y2,'b-',T2,Y_a,'ro')
title('Comparison of ODE45 and Analytical Solution')
xlabel('Time (seconds)')
ylabel('Water Level (meters)')
legend('ODE45 Solution','Analytical Solution')
grid on

subplot(2,2,4)
plot(T2,abs(Y_a-Y2))
title('Residual Plot')
xlabel('Time (seconds)')
ylabel('Residual Error')
grid on

%% Conclusion
% After finishing this lab, we will get 4 graphs that show us the details with the ODE45 code. 