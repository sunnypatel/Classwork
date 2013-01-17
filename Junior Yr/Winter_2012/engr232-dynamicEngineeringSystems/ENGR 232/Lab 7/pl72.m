function d2y = pl72(t,Y)
g = 9.8; m = 75; ka = 12;
y0 = 200; l = 60; kv = 0; ke = 7;
y = Y(1,1);
yprime = Y(2,1);
x1 = y;
x2 = yprime;
if (y > (y0 - l));
    x1dot = x2;
    x2dot = -g-ka/m*x2;
else (y <= (y0 - l));
    x1dot = x2;
    x2dot = (-g+ke/m*y0 -ke/m*l)-(ka/m+kv/m)*x2-ke/m*x1;
end
d2y(1,1) = x1dot;
d2y(2,1) = x2dot;