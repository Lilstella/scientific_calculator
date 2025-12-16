module fast_power

export f_power

function f_power(x::Real, n::Int)
    n < 0 && return 1 / f_power(x, -n)

    result = 1.0

    for _ in 1:n
        result *= x
    end

    return result
end

end