module scientific_calculator

export Calculator,
    add!, substract!, multiply!, divide!,
    factorial!, sin!, cos!, exp!,
    power!,
    restart!, velocity!

include("taylor/taylor.jl")
using .taylor

mutable struct Calculator{T<:Real}
    value::T
    fast_mode::Bool
    terms::Int
end

Calculator(; fast_mode=false, terms=10) = Calculator(0.0, fast_mode, terms)

add!(calc::Calculator, a::Float64, b::Float64) = calc.value = a + b

substract!(calc::Calculator, a::Float64, b::Float64) = calc.value = a - b

multiply!(calc::Calculator, a::Float64, b::Float64) = calc.value = a * b

divide!(calc::Calculator, a::Float64, b::Float64) = b == 0.0 ? throw(DivideError()) : calc.value = a / b

factorial!(calc::Calculator, n::Int) = calc.value = calc.fast_mode ? f_factorial(n) : r_factorial(n)

sin!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_sin(x, calc.terms) : r_sin(x, 0, calc.terms)

cos!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_cos(x, calc.terms) : r_cos(x, 0, calc.terms)

exp!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_exp(x, calc.terms) : r_exp(x, 0, calc.terms)

power!(calc::Calculator, x::Real, n::Int) = calc.value = calc.fast_mode ? f_power(x, n) : r_power(x, n)

restart!(calc::Calculator) = calc.value = 0.0

velocity!(calc::Calculator, fast_mode::Bool) = calc.fast_mode = fast_mode

precision!(calc::Calculator, terms::Int) = calc.terms = terms

end
