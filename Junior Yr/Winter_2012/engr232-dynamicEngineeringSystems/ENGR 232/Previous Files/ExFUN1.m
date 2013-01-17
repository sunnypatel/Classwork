function XYdot=ExFUN1(t,XY)

x=XY(1,1);
y=XY(2,1);

xdot=-3*x+2*y;
ydot=-2*x-3*y;

XYdot(1,1)=xdot;
XYdot(2,1)=ydot;