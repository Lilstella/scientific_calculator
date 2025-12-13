module scientific_calculator

export Calculator,
    add!, substract!, multiply!, divide!,
    factorial!, sin!, cos!, exp!,
    restart!, velocity!

include("taylor/taylor.jl")
using .taylor

mutable struct Calculator
    value::Real
    fast_mode::Bool
end

Calculator(; fast_mode=false) = Calculator(0.0, fast_mode)

add!(calc::Calculator, a::Float64, b::Float64) = calc.value = a + b

substract!(calc::Calculator, a::Float64, b::Float64) = calc.value = a - b

multiply!(calc::Calculator, a::Float64, b::Float64) = calc.value = a * b

divide!(calc::Calculator, a::Float64, b::Float64) = b == 0.0 ? throw(DivideError()) : calc.value = a / b

factorial!(calc::Calculator, n::Int) = calc.value = calc.fast_mode ? f_factorial(n) : r_factorial(n)

sin!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_sin(x) : r_sin(x)

cos!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_cos(x) : r_cos(x)

exp!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_exp(x) : r_exp(x)

restart!(calc::Calculator) = calc.value = 0.0

velocity!(calc::Calculator, fast_mode::Bool) = calc.fast_mode = fast_mode

end
