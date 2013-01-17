function XYdot = diffeq(t,XY)
x = XY(1,1);
y = XY(2,1);

xdot =  -x + 4*y - 11;
ydot = -4*x - y - 35;

XYdot(1,1) = xdot;
XYdot(2,1) = ydot;