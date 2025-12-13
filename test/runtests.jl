using Test
using scientific_calculator

@testset "ScientificCalculator Tests" begin
    calc = Calculator()

    @testset "Addition" begin
        add!(calc, 3.0, 5.0)
        @test calc.value == 8.0
    end

    @testset "Subtraction" begin
        substract!(calc, 10.0, 4.0)
        @test calc.value == 6.0
    end

    @testset "Multiplication" begin
        multiply!(calc, 2.0, 3.5)
        @test calc.value == 7.0
    end

    @testset "Division" begin
        divide!(calc, 9.0, 3.0)
        @test calc.value == 3.0

        @test_throws DivideError divide!(calc, 5.0, 0.0)
    end

    @testset "Factorial" begin
        factorial!(calc, 5)
        @test calc.value == 120.0
    end

    @testset "Sine" begin
        sin!(calc, π/2)
        @test isapprox(calc.value, 1.0; atol=1e-5)
    end

    @testset "Cosine" begin
        cos!(calc, π)
        @test isapprox(calc.value, -1.0; atol=1e-5)
    end

    @testset "Exponential" begin
        exp!(calc, 1.0)
        @test isapprox(calc.value, ℯ; atol=1e-5)
    end

    @testset "Restart" begin
        add!(calc, 10.0, 5.0)
        restart!(calc)
        @test calc.value == 0.0
    end
end
