% Define the function to find the root of
f = @(x) x^3 - 6*x^2 + 11*x - 6;

% Define the interval [a, b] and the desired tolerance
a = 1; % Lower bound of the interval
b = 4; % Upper bound of the interval
tolerance = 1e-6; % Tolerance for convergence

% Initialize matrices to store data for plotting
iterations = [];
roots = [];

% Implement False-Position method
while (b - a) >= tolerance
    % Calculate the function values at the endpoints
    fa = f(a);
    fb = f(b);

    % Calculate the next estimate for the root using False-Position
    c = a - (fa * (b - a)) / (fb - fa);
    fc = f(c);

    % Store the current iteration and root estimate
    iterations = [iterations; a, b];
    roots = [roots; c];

    % Check for convergence
    if fc == 0
        break; % Exact root found
    elseif fa * fc < 0
        b = c;
    else
        a = c;
    end
end

% Display the final root
fprintf('Approximate root: %f\n', c);

% Plot the function and the iterations
x = linspace(0, 5, 1000); % Create x values for plotting
y = f(x);

figure;
plot(x, y, 'DisplayName', 'f(x)');
hold on;
scatter(roots, f(roots), 'r', 'filled', 'DisplayName', 'Root Estimates');
title('False-Position Method for Root Finding');
xlabel('x');
ylabel('f(x)');
legend;

% Plot the iterations and root convergence
figure;
plot(1:size(iterations, 1), iterations(:, 1), 'r', 'DisplayName', 'Interval Start');
hold on;
plot(1:size(iterations, 1), iterations(:, 2), 'b', 'DisplayName', 'Interval End');
plot(1:size(roots, 1), roots, 'g', 'DisplayName', 'Root Estimates');
title('False-Position Iterations and Root Convergence');
xlabel('Iterations');
ylabel('x');
legend;

