module recursive_trigonometry

export r_factorial, r_sin, r_cos, r_exp

include("../../helper/angle.jl")
using .Angle

function r_factorial(n::Int)
    if n < 0
        throw(ArgumentError("There is not factorial for negative errors"))
    end

    if n <= 1
        return 1
    end

    return n * r_factorial(n - 1)
end

function r_sin(x::Real, terms::Int)
    x = normalize_angle(float(x))
    if abs(x) < 1e-15
        return 0.0
    end
    return _r_sin(x, 0, float(x), terms)
end

function _r_sin(x::Real, n::Int = 0, term::Float64 = float(x), terms::Int = 10)
    if n == terms
        return 0.0
    end

    if n > 0
        term *= -x * x / ((2n) * (2n + 1))
    end

    return term + _r_sin(x, n + 1, term, terms)
end

function r_cos(x::Real, terms::Int)
    x = normalize_angle(float(x))
    if abs(x) < 1e-15
        return 1.0
    end
    return _r_cos(x, 0, 1.0, terms)
    
end

function _r_cos(x::Real, n::Int = 0, term::Float64 = 1.0, terms::Int = 10)
    if n == terms
        return 0.0
    end

    if n > 0
        term *= -x * x / ((2n - 1) * (2n))
    end

    return term + _r_cos(x, n + 1, term, terms)
end

function r_exp(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    value = (x ^ n) / r_factorial(n)

    return value + r_exp(x, n + 1, terms - 1)
end

end