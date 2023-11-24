
#include <iostream>
#include <vector>

using namespace std;

// Function to perform Naïve Gauss elimination
void gaussElimination(vector<vector<double>> &matrix)
{
    int n = matrix.size();

    // Forward elimination
    for (int i = 0; i < n - 1; ++i)
    {
        for (int k = i + 1; k < n; ++k)
        {
            double factor = matrix[k][i] / matrix[i][i];
            for (int j = i; j <= n; ++j)
            {
                matrix[k][j] -= factor * matrix[i][j];
            }
        }
    }

    // Back substitution
    for (int i = n - 1; i >= 0; --i)
    {
        matrix[i][n] /= matrix[i][i];
        matrix[i][i] = 1;

        for (int k = i - 1; k >= 0; --k)
        {
            matrix[k][n] -= matrix[k][i] * matrix[i][n];
            matrix[k][i] = 0;
        }
    }
}

int main()
{
    // Velocity vs. time data
    vector<double> time = {5, 8, 12};
    vector<double> velocity = {106.8, 177.2, 279.2};

    // Number of data points
    int n = time.size();

    // Matrix to store the coefficients
    vector<vector<double>> matrix(n, vector<double>(n + 1, 0.0));

    // Populate the matrix
    for (int i = 0; i < n; ++i)
    {
        matrix[i][0] = time[i] * time[i];   // a1*t^2
        matrix[i][1] = time[i];             // a2*t
        matrix[i][2] = 1;                    // a3
        matrix[i][n] = velocity[i];          // Velocity values
    }

    // Apply Gauss elimination
    gaussElimination(matrix);

    // Print the coefficients
    cout << "Coefficients: "<<endl;
    for (int i = 0; i < n; ++i)
    {
        cout << "a"<<i+1<<" = "<<matrix[i][n] << endl;
    }

    cout << endl;

    // Calculate velocity at t = 6 seconds
    double t = 6;
    double result = matrix[0][n] * t * t + matrix[1][n] * t + matrix[2][n];

    // Print the result
    cout << "Velocity at t = 6 seconds: " << result << " m/s" << endl;

    return 0;
}
