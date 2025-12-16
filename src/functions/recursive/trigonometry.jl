module recursive_trigonometry

export r_factorial, r_sin, r_cos, r_exp

function r_factorial(n::Int)
    if n < 0
        throw(ArgumentError("There is not factorial for negative errors"))
    end

    if n <= 1
        return 1
    end

    return n * r_factorial(n - 1)
end

function r_sin(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    sign = isodd(n) ? -1 : 1
    exponent = 2*n + 1
    value = (sign * (x ^ exponent)) / r_factorial(2*n + 1)
    
    return value + r_sin(x, n + 1, terms - 1)
end

function r_cos(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    sign = isodd(n) ? -1 : 1
    exponent = 2*n
    value = (sign * (x ^ exponent)) / r_factorial(2*n)

    return value + r_cos(x, n + 1, terms -1)
end

function r_exp(x::Real, n::Int = 0, terms::Int = 10)
    if terms == 0
        return 0
    end

    value = (x ^ n) / r_factorial(n)

    return value + r_exp(x, n + 1, terms - 1)
end

end