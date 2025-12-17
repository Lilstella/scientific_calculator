module recursive_power

export r_power, r_sqrt

function r_power(x::Real, n::Int)
    if n < 0
       return 1 / r_power(x, -n)
    end

    if n == 0
        return 1
    end

    return x * r_power(x, n - 1)

end

function r_sqrt(x::Real, down::Real = 0.0, high::Union{Real, Nothing} = nothing, tol::Real = 1e-10)
    x < 0 && throw(ArgumentError("Dont exists sqrt for negative numbers"))

    if high === nothing
        high = max(1.0, x)
    end

    mid = (down + high) / 2
    mid_squared = mid * mid

    if abs(mid_squared - x) <= tol
        return mid
    end

    if mid_squared < x
        return r_sqrt(x, mid, high, tol)
    end

    return r_sqrt(x, down, mid, tol)
end

end