function hdot = diffeq(t,h)
r = 1;
r0 = .1;
a = r0^2*pi;
A = r^2*pi;
g = 9.8;

hdot = (-0.6*a/A)*sqrt(2*g*h);