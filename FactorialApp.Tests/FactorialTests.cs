using Xunit;

public class FactorialTests
{
    [Fact]
    public void Factorial_Of_0_Is_1() => Assert.Equal(1, Factorial.Compute(0));

    [Fact]
    public void Factorial_Of_5_Is_120() => Assert.Equal(120, Factorial.Compute(5));

    [Fact]
    public void Factorial_Throws_On_Negative() =>
        Assert.Throws<System.ArgumentException>(() => Factorial.Compute(-3));

    [Fact]
    public void Factorial_Throws_On_Overflow() =>
        Assert.Throws<System.OverflowException>(() => Factorial.Compute(100));
}