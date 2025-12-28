@testset "Power" begin
    power!(calc, 2.0, 3)
    @test calc.value == 8.0

    power!(calc, 2.0, -2)
    @test isapprox(calc.value, 0.25; atol=1e-5)

end