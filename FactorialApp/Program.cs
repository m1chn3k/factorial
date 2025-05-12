using System;

class Program
{
    static int Main(string[] args)
    {
        try
        {
            if (args.Length != 1 || !int.TryParse(args[0], out int n))
            {
                Console.Error.WriteLine("Usage: FactorialApp <non-negative integer>");
                return 1;
            }

            long result = Factorial.Compute(n);
            Console.WriteLine(result);
            return 0;
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"Error: {ex.Message}");
            return 2;
        }
    }
}
