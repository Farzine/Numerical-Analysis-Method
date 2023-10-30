disp("Bisection Method: ");

% Define x as a symbolic variable
system x:x^

% Initialize variables
y = input('Enter the non-linear equation as a function of x: ', 's'); % Note: 's' reads the input as a string
a = input('Enter the first guess (a): ');
b = input('Enter the second guess (b): ');
e = input('Tolerance (e): ');

% Convert the input string 'y' into a symbolic expression
y = system(y);

% Functional value
fa = subs(y, x, a);
fb = subs(y, x, b);

% Bisection Method
if fa * fb > 0
    disp('Initial values do not include the root: f(a) and f(b) do not have opposite signs.');
else
    c = (a + b) / 2;
    fc = subs(y, x, c);
    fprintf('\n\na\t\tb\t\tc\t\tf(c)\n');

    while abs(fc) > e
        fprintf('%f\t%f\t%f\t%f\n', a, b, c, fc);
        if fa * fc < 0
            b = c;
        else
            a = c;
        end
        c = (a + b) / 2;
        fc = subs(y, x, c);
    end

    fprintf('\nRoot is: %f\n', c);
end

