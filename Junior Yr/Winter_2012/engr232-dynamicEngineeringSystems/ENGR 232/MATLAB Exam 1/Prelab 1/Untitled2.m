t = 0:.05:5;
a = [0.1 1 10 100];
nA = numel(a);
nT = numel(t);
y = zeros(nA,nT);

for k = 1:nA
    y(k,:) = f(t,a(k));
end

plot(t,y)
grid on
legend('a=.1','a=1','a=10','a=100')
title('ENGR 232: Lab 1 Prelab')
xlabel('f(t,a)')
ylabel('Time,t')