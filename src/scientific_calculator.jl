module scientific_calculator

export Calculator,
    add!, substract!, multiply!, divide!,
    factorial!, sin!, cos!, exp!,
    power!, sqrt!,
    restart!, velocity!, precision!

include("config/precision.jl")
using .PrecisionConfig: @apply_precision

include("functions/functions.jl")
using .functions

mutable struct Calculator{T<:Real}
    value::T
    fast_mode::Bool
    precision::Symbol
    terms::Int
    tolerance::T
end

function Calculator{T}(; 
      fast_mode::Bool=false,
      precision::Symbol=:medium
    ) where {T<:Real}

    calc = Calculator{T}(zero(T), fast_mode, precision, 0, zero(T))
    @apply_precision(calc, precision)
end

Calculator(; fast_mode=false, precision=:medium) = Calculator{Float64}(; fast_mode, precision)

restart!(calc::Calculator) = (calc.value = zero(calc.value))

velocity!(calc::Calculator, fast_mode::Bool) = (calc.fast_mode = fast_mode)

precision!(calc::Calculator, precision::Symbol) = @apply_precision(calc, precision)

add!(calc::Calculator, a::Float64, b::Float64) = calc.value = a + b

substract!(calc::Calculator, a::Float64, b::Float64) = calc.value = a - b

multiply!(calc::Calculator, a::Float64, b::Float64) = calc.value = a * b

divide!(calc::Calculator, a::Float64, b::Float64) = b == 0.0 ? throw(DivideError()) : calc.value = a / b

factorial!(calc::Calculator, n::Int) = calc.value = calc.fast_mode ? f_factorial(n) : r_factorial(n)

sin!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_sin(x, calc.terms) : r_sin(x, 0, calc.terms)

cos!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_cos(x, calc.terms) : r_cos(x, 0, calc.terms)

exp!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_exp(x, calc.terms) : r_exp(x, 0, calc.terms)

power!(calc::Calculator, x::Real, n::Int) = calc.value = calc.fast_mode ? f_power(x, n) : r_power(x, n)

sqrt!(calc::Calculator, x::Real) = calc.value = calc.fast_mode ? f_sqrt(x, calc.tolerance) : r_sqrt(x, calc.tolerance)

end
