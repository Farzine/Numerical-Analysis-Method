% Define the function to find the root of
f = @(x) x^3 - 6*x^2 + 11*x - 6;

% Define the derivative of the function (f'(x))
df = @(x) 3*x^2 - 12*x + 11;

% Initial guess
x0 = 2;

% Define the maximum number of iterations
maxIterations = 20;

% Initialize matrices to store data for plotting
iterations = [];
roots = [];

% Implement Newton-Raphson method
for i = 1:maxIterations
    % Calculate the current function value and its derivative
    fi = f(x0);
    dfi = df(x0);

    % Calculate the next estimate for the root
    x1 = x0 - fi / dfi;

    % Store the current iteration and root estimate
    iterations = [iterations; x0];
    roots = [roots; x1];

    % Check for convergence (using a small tolerance)
    if abs(x1 - x0) < 1e-6
        break;
    end

    % Update the current estimate for the next iteration
    x0 = x1;
end

% Display the final root
fprintf('Approximate root: %f\n', x1);

% Plot the function, iterations, roots, and tangent lines
x = linspace(0, 5, 1000); % Create x values for plotting
y = f(x);

figure;
plot(x, y, 'DisplayName', 'f(x)');
hold on;
scatter(iterations, f(iterations), 'r', 'filled', 'DisplayName', 'Root Estimates');
xlabel('x');
ylabel('f(x)');
title('Newton-Raphson Method for Root Finding');
legend;

% Draw tangent lines
for i = 1:size(iterations, 1)
    x0 = iterations(i);
    slope = df(x0);
    y0 = f(x0);
    tangent_line = slope * (x - x0) + y0;
    plot(x, tangent_line, 'g--', 'HandleVisibility', 'off');
end


