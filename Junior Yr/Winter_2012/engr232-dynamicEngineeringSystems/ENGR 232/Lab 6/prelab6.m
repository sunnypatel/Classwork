g=9.8;
l=10;
A=[0 1;-g/l 0];
t=0:0.05:60;
IC1=[.25;0];
IC2=[1.50;0];
[V D]=eig(A);
c1=V^(-1)*IC1;
xy=zeros(2,numel(t));

for i=1:numel(t);
    xy(:,i)=c1(1)*exp(D(1)*t(i))*V(:,1)+c1(2)*exp(D(4)*t(i))*V(:,2);
end

subplot(2,2,1)
plot(t,xy(1,:),'g')
hold on
[t QW] = ODE45(@diffeql6,t,IC1);
plot(t,QW(:,1))
axis([0 60 -1 1])
grid on
title('Initial Deviation: 0.25 radians')
legend('Original System','Linearized System') 
ylabel('Angular Deviation')

error=abs(QW(:,1)-(xy(1,:))');
subplot(2,2,3)
plot(t,error)
maxerror=max(error)
grid on
xlabel('Time')
ylabel('abs(Residual error)')
c2=V^(-1)*IC2;

for i=1:numel(t);
    xy(:,i)=c2(1)*exp(D(1)*t(i))*V(:,1)+c2(2)*exp(D(4)*t(i))*V(:,2);
end

subplot(2,2,2)
plot(t,xy(1,:))
hold on
[t QW] = ODE45(@diffeql6,t,IC2);
plot(t,QW(:,1),'g')
axis([0 60 -4 4])
grid on
title('Initial Deviation: 1.5 radians')
legend('Linearized System','Original System') 
ylabel('Angular Deviation')  

error=abs(QW(:,1)-(xy(1,:))');
subplot(2,2,4)
plot(t,error)
maxerror=max(error)
grid on
xlabel('Time')
ylabel('abs(Residual error)')