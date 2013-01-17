function dudt = diffeq(t,u)
k = .25
dudt = -k*(u-(75+15*sin(2*pi*t)));