clear, clc
t=0:0.01:(3*pi);
sol= L1_FUN(t)
plot(t,sol)
grid on
title('ENGR Lab1')
xlabel('Time')
ylabel('Magnitude')
