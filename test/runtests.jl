using Test
using scientific_calculator

@testset "ScientificCalculator Tests" begin
    include("test_arithmetic.jl")
    include("test_trigonometry.jl")
    #include("test_power.jl")
    #include("test_config.jl")
end
