@testset "trigonometry" begin

    @testset "Factorial" begin
        calc_fast = Calculator(fast_mode=true)
        calc_slow = Calculator(fast_mode=false)

        factorial!(calc_fast, 5)
        factorial!(calc_slow, 5)
        @test (calc_fast.value == 120.0 && calc_slow.value == 120.0)

        factorial!(calc_fast, 0)
        factorial!(calc_slow, 0)
        @test (calc_fast.value == 1.0 && calc_slow.value == 1.0)

        factorial!(calc_fast, 10)
        factorial!(calc_slow, 10)
        @test (calc_fast.value == 3628800.0 && calc_slow.value == 3628800.0)
    end

    @testset "Sine" begin
        for precision in (:low, :medium, :high, :extreme)
            calc_fast = Calculator(fast_mode=true)
            calc_slow = Calculator(fast_mode=false)

            precision!(calc_fast, precision)
            precision!(calc_slow, precision)

            for (x, expected) in (
                (π/2, 1.0),
                (0.0, 0.0),
                (π,   0.0)
            )
                sin!(calc_fast, x)
                sin!(calc_slow, x)

                @test !isnan(calc_fast.value)
                @test isapprox(calc_slow.value, expected; atol=1e-2)
            end
        end
    end

    @testset "Cosine" begin
        for precision in (:low, :medium, :high, :extreme)
            calc_fast = Calculator(fast_mode=true)
            calc_slow = Calculator(fast_mode=false)

            precision!(calc_fast, precision)
            precision!(calc_slow, precision)

            for (x, expected) in (
                (π, -1.0),
                (0.0, 1.0),
                (π/2, 0.0)
            )
                cos!(calc_fast, x)
                cos!(calc_slow, x)

                @test !isnan(calc_fast.value)
                @test isapprox(calc_slow.value, expected; atol=1e-2)
            end
        end
    end
#=
    @testset "Cosine" begin
        cos!(calc, π)
        @test isapprox(calc.value, -1.0; atol=1e-5)
    end

    @testset "Exponential" begin
        exp!(calc, 1.0)
        @test isapprox(calc.value, ℯ; atol=1e-5)
    end
=#
end