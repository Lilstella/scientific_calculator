@testset "Restart" begin
    add!(calc, 10.0, 5.0)
    restart!(calc)
    @test calc.value == 0.0
end

@testset "Fast Mode Toggle" begin
    velocity!(calc, true)
    @test calc.fast_mode == true

    velocity!(calc, false)
    @test calc.fast_mode == false
end

@testset "Precision Setting" begin
    precision!(calc, :high)
    @test calc.precision === :high
    @test calc.terms == 20
    @test calc.tolerance == 1e-12

    precision!(calc, :low)
    @test calc.precision === :low
    @test calc.terms == 5
    @test calc.tolerance == 1e-3
end