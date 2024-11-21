clc
clear all;

m = 0.11; 
g = 9.8;
j = 9.99*10^(-6);
R = 0.015;
d = 0.03;
l = 1;
N = -17.1874;
K =[ -17.1874  -22.0571   71.0000   14.0000];

u1 = @(t) 1 * (t >= 1)  ; 

ode_function = @(t, x) [
    x(2);
    ((m*x(1)*(x(4)^2)-m*g*sin(x(3)))/((j/R^2)+m));
    x(4);
    u1(t);
];

initial_conditions = [20; 20; 20; 20];
 
t_span =  linspace(0, 10, 40000);

[t, x] = ode45(ode_function, t_span, initial_conditions);

y = x(:, 1);

% observer 
A = [0 1 0 0;
     0 0 -6.9819 0;
     0 0 0 1;
     0 0 0 0];
B = [0; 0; 0; 1];
C = [1 0 0 0];
observer_pole = [ -1 -1.5 -3 -4 ] ;
L_transpose = acker ( A' , C' , observer_pole ) ;
L = L_transpose' ; 

Anew = A-L*C ; 
Bnew = [ B , L ] ; 
Cnew = C ; 

%Initial conditions for observer

initial_conditions_observer = [1; 1; 1; 1] ;

observer = ss(Anew , Bnew , Cnew , 0);
u = ones(size(t));
u_y = [u , y];

[y_observer, t , x_observer] = lsim(observer, u_y, t_span, initial_conditions_observer);
%plots

figure;
subplot(4, 1, 1);
plot(t, x(:, 1), 'LineWidth', 2, 'DisplayName', 'State 1');
hold on;
plot(t, x_observer(:, 1), 'LineWidth', 2, 'DisplayName', 'State observer');
hold on;
grid on;

subplot(4, 1, 2);
plot(t, x(:, 2), 'LineWidth', 2, 'DisplayName', 'State 2');
hold on;
plot(t, x_observer(:, 2), 'LineWidth', 2, 'DisplayName', 'State observer');
hold on;

subplot(4, 1, 3);
plot(t, x(:, 3), 'LineWidth', 2, 'DisplayName', 'State 3');
hold on;
plot(t, x_observer(:, 3), 'LineWidth', 2, 'DisplayName', 'State observer');
hold on;
grid on;
subplot(4, 1, 4);
plot(t, x(:, 4), 'LineWidth', 2, 'DisplayName', 'State 4');
hold on;
plot(t, x_observer(:, 4), 'LineWidth', 2, 'DisplayName', 'State observer');
hold on;
grid on;