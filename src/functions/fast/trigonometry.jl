module fast_trigonometry

export f_sin, f_cos, f_exp, f_factorial

include("../../helper/angle.jl")
using .Angle

function f_factorial(n::Integer)
    n < 0 && throw(ArgumentError("There is not factorial for negative errors"))

    result = one(n)
    for i in 2:n
        result *= i
    end

    return result
end

function f_sin(x::Real, terms::Int = 10)
    x = normalize_angle(float(x))
    x2 = x * x

    term = x
    total = term

    for n in 1:terms-1
        term *= -x2 / ((2n) * (2n + 1))
        total += term
    end

    return total
end

function f_cos(x::Real, terms::Int = 10)
    x = float(x)
    x2 = x * x

    term = 1.0
    total = term

    for n in 1:terms-1
        term *= -x2 / ((2n - 1) * (2n))
        total += term
    end

    return total
end

function f_exp(x::Real, terms::Int = 10)
    x = float(x)

    term = 1.0
    total = term

    for n in 1:terms-1
        term *= x / n
        total += term
    end

    return total
end

end