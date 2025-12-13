module taylor

export t_sin, t_cos, t_exp, t_factorial

function t_factorial(n::Int)
    if n < 0
        throw(ArgumentError("There is not factorial for negative errors"))
    end

    if n <= 1
        return 1
    end

    return n * factorial(n - 1)
end

function t_sin(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    sign = isodd(n) ? -1 : 1
    exponent = 2*n + 1
    value = (sign * (x ^ exponent)) / factorial(2*n + 1)
    
    return value + t_sin(x, n + 1, terms - 1)
end

function t_cos(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    sign = isodd(n) ? -1 : 1
    exponent = 2*n
    value = (sign * (x ^ exponent)) / factorial(2*n)

    return value + t_cos(x, n + 1, terms -1)
end

function t_exp(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    value = (x ^ n) / factorial(n)

    return value + t_exp(x, n + 1, terms - 1)
end

end
