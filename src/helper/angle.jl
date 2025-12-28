module Angle
    export normalize_angle

    function normalize_angle(x::Real)
        x = float(x)
        return mod(x + π, 2π) - π
    end
end