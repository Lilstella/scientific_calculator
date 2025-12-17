module fast_power

export f_power, f_sqrt

function f_power(x::Real, n::Int)
    n < 0 && return 1 / f_power(x, -n)

    result = 1.0

    for _ in 1:n
        result *= x
    end

    return result
end

function f_sqrt(x::Real, tol::Real = 1e - 10)
    x < 0 && throw(ArgumentError("Dont exists sqrt for negative numbers"))
    x == 0 && return 0.0

    y = x
    while abs(y*y - x) > tol
        y = (y + x/y) / 2
    end

    return y
end

end