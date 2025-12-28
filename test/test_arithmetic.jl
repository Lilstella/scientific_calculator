@testset "Arithmetic" begin

    @testset "Addition" begin
        calc = Calculator()

        add!(calc, 3.0, 5.0)
        @test calc.value == 8.0

        add!(calc, -2.0, 4.0)
        @test calc.value == 2.0

        add!(calc, 0.0, 0.0)
        @test calc.value == 0.0

        add!(calc, 1e-10, 1e-10)
        @test calc.value ≈ 2e-10 atol = 1e-15
    end

    @testset "Subtraction" begin
        calc = Calculator()

        substract!(calc, 10.0, 4.0)
        @test calc.value == 6.0

        substract!(calc, 3.0, 7.0)
        @test calc.value == -4.0

        substract!(calc, 0.0, 0.0)
        @test calc.value == 0.0

        substract!(calc, 1e-10, 5e-11)
        @test calc.value ≈ 5e-11 atol = 1e-15
    end

    @testset "Multiplication" begin
        calc = Calculator()

        multiply!(calc, 2.0, 3.5)
        @test calc.value == 7.0

        multiply!(calc, -4.0, 2.0)
        @test calc.value == -8.0

        multiply!(calc, 0.0, 100.0)
        @test calc.value == 0.0

        multiply!(calc, 1e-8, 1e-8)
        @test calc.value ≈ 1e-16 atol = 1e-18
    end

    @testset "Division" begin
        calc = Calculator()

        divide!(calc, 9.0, 3.0)
        @test calc.value == 3.0

        divide!(calc, -8.0, 2.0)
        @test calc.value == -4.0

        divide!(calc, 1.0, 3.0)
        @test calc.value ≈ 1.0/3.0 atol = 1e-12

        @test_throws DivideError divide!(calc, 5.0, 0.0)
    end
end