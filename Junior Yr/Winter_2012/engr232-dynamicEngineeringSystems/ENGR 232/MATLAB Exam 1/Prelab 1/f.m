function y = f(t,a)
y = 10*exp(-t/a).*(t./sqrt(1+t.^2));