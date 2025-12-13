module scientific_calculator

export Calculator,
    add!, substract!, multiply!, divide!,
    factorial!, sin!, cos!, exp!,
    restart!

include("taylor/taylor.jl")
using .taylor

mutable struct Calculator
    value::Real
end

Calculator() = Calculator(0.0)

add!(calc::Calculator, a::Float64, b::Float64) = calc.value = a + b

substract!(calc::Calculator, a::Float64, b::Float64) = calc.value = a - b

multiply!(calc::Calculator, a::Float64, b::Float64) = calc.value = a * b

divide!(calc::Calculator, a::Float64, b::Float64) = b == 0.0 ? throw(DivideError()) : calc.value = a / b

factorial!(calc::Calculator, n::Int) = calc.value = t_factorial(n)

sin!(calc::Calculator, x::Real) = calc.value = t_sin(x)

cos!(calc::Calculator, x::Real) = calc.value = t_cos(x)

exp!(calc::Calculator, x::Real) = calc.value = t_exp(x)

restart!(calc::Calculator) = calc.value = 0.0

end
