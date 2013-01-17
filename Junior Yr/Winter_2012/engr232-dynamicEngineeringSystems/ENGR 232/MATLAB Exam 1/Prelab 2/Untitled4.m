dt = .8;
tI = 0;
tEnd = 20;
t = tI:dt:tEnd;

u = zeros(size(t));
u(1) = 70;

for k = 2:numel(u)
    uPrime = diffeq(t(k-1),u(k-1));
    u(k) = u(k-1) + dt*uPrime;
end

plot(t,u,'b')
hold on

dt = .1;
tI = 0;
tEnd = 20;
t = tI:dt:tEnd;

u = zeros(size(t));
u(1) = 70

for k = 2:numel(u)
    uPrime = diffeq(t(k-1),u(k-1));
    u(k) = u(k-1) + dt*uPrime;
end

plot(t,u,'r')
hold off
grid on
xlabel('Time')
ylabel('y(t)')
legend('dt = 0.8','dt = 0.1')
