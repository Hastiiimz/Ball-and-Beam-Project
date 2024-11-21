clc
clear all;

m = 0.11; 
g = 9.8;
j = 9.99*10^(-6);
R = 0.015;
d=0.03;
l=1;

%%defining matrices of state space
C=[1,0,0,0]
B=[0;0;0;1]
A=[0,1,0,0; 0,0,(-m*g)/((j/R^2)+m),0; 0,0,0,1; 0,0,0,0]

syms s;
TransferFunc=C*inv(s*(eye(4))-A)*B


sys=ss(A,B,C,0)
pol=pole(sys)
eigenvalue = eig(A)

figure(1)
step(sys)

p = [-2, -3, -4, -5];   %%desired closed loop poles
K = acker(A,B,p)
%%N DESIGN:
g=-C*inv((A-B*K))*B;
N=inv(g)
K
L=K'
L*C

SysCL = ss(A-B*K,B,C,0)

figure(2)
step(SysCL);
hold on;





