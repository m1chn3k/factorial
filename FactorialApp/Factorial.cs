using System;

public static class Factorial
{
    public static long Compute(int n)
    {
        if (n < 0)
            throw new ArgumentException("Factorial is not defined for negative numbers.");

        long result = 1;
        for (int i = 2; i <= n; i++)
        {
            checked { result *= i; } // catch overflow
        }
        return result;
    }
}