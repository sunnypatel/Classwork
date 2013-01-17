function ydot = L3PL_a(t,h)
r = 1; 
ro = 0.1;
a = ro^2*pi;
A = r^2*pi;
g = 9.8;
ydot = -0.6*a/A*sqrt(2*g*h);