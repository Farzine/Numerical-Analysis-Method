% Input matrices A and B
A = input('Enter matrix A (e.g., [1 2; 3 4];): ');
B = input('Enter matrix B (e.g., [5 6; 7 8];): ');

% Check if matrices A and B are valid for multiplication
if size(A, 2) ~= size(B, 1)
    fprintf('Matrix multiplication is not possible. The number of columns in A must be equal to the number of rows in B.\n');
else
    % Find the maximum value in matrix A
    maxA = max(A(:));

    fprintf('Matrix A:\n');
    disp(A);

    fprintf('Matrix B:\n');
    disp(B);

    fprintf('Maximum value in matrix A: %f\n', maxA);

    % Perform matrix multiplication
    result = A * B;

    fprintf('Matrix A * B:\n');
    disp(result);
end
