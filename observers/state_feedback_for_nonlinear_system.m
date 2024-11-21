m = 0.11; 
g = 9.8;
j = 9.99*10^(-6);
R = 0.015;
d = 0.03;
l = 1;
u1 = @(t) 1 * (t >= 1)  ; 
ode_function = @(t, x) [
    x(2);
   (m*x(1)*(x(4)^2)-m*g*sin(x(3)))/((j/R^2)+m);
    x(4);
    -k*x+N*u1(t) ;
];
initial_conditions = [0.2; 0.3; 0.2; 0.3];
t_span =  linspace(0, 10, 400);
[t, x] = ode45(ode_function, t_span, initial_conditions);
y = x(:, 1);

figure;
subplot(3, 1, 1);
plot(t, x(:, 1), 'LineWidth', 2, 'DisplayName', 'State 1');
hold on;
plot(t, x(:, 2), 'LineWidth', 2, 'DisplayName', 'State 2');
hold on;
plot(t, x(:, 3), 'LineWidth', 2, 'DisplayName', 'State 3');
hold on;
plot(t, x(:, 4), 'LineWidth', 2, 'DisplayName', 'State 4');
xlabel('Time');
ylabel('States');
title('Simulation of Nonlinear System with Step Input');
legend('Location', 'Best');
grid on;

subplot(3, 1, 2);
stairs(t, u1(t), 'r', 'LineWidth', 2, 'DisplayName', 'u1(t)');
hold on;
xlabel('Time');
ylabel('Input');
legend('Location', 'Best');
grid on;

subplot(3, 1, 3);
plot(t, y, 'g', 'LineWidth', 2, 'DisplayName', 'Output (State 1)');
xlabel('Time');
ylabel('Output');
legend('Location', 'Best');
grid on;