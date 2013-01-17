function QWdot=diffeql6(t,QW);
Q=QW(1,1);
W=QW(2,1);
Qdot=W;
Wdot=-9.8/10*sin(Q);
QWdot(1,1)=Qdot;
QWdot(2,1)=Wdot;