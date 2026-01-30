module Angle
    export normalize_angle

    function normalize_angle(x::Real)
        x = float(x)

        result = rem2pi(x, RoundNearest)

        if abs(result) < 1e-15
            return 0.0
        end
        return result
    end
end