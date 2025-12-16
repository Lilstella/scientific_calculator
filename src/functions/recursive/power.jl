module recursive_power

export r_power

function r_power(x::Real, n::Int)
    if n < 0
       return 1 / r_power(x, -n)
    end

    if n == 0
        return 1
    end

    return x * r_power(x, n - 1)

end

end