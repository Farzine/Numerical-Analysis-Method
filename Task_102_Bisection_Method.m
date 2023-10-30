% Define your target equation as a function
f = @(x) x^3 - 4*x - 9;

% Initialize variables
a = 2;  % Lower bound
b = 3;  % Upper bound
tolerance = 1e-6;  % Tolerance
maxIterations = 100;  % Maximum number of iterations

% Initialize variables to store results
roots = [];
iterations = [];

for i = 1:maxIterations
    c = (a + b) / 2;
    fa = f(a);
    fb = f(b);
    fc = f(c);
    
    roots = [roots; c];
    iterations = [iterations; i];
    
    if abs(fc) < tolerance
        break;
    end
    
    if fa * fc < 0
        b = c;
    else
        a = c;
    end
end

% Print the result
fprintf('Root: %.6f\n', c);

% Plot the equation with the matrix of root
x = linspace(0, 4, 1000);
y = f(x);

figure;
plot(x, y, 'b', roots, f(roots), 'ro');
title('Bisection Method');
xlabel('x');
ylabel('f(x)');
grid on;
legend('f(x)', 'Roots');
