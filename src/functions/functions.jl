module Functions

include("fast/trigonometry.jl")
include("recursive/trigonometry.jl")

include("fast/power.jl")
include("recursive/power.jl")

using .fast_trigonometry
using .recursive_trigonometry

using .fast_power
using .recursive_power

export f_cos, f_exp, f_sin, f_factorial,
       r_cos, r_exp, r_sin, r_factorial,

       f_power, f_sqrt,
       r_power, r_sqrt

# Exporting functions from fast_trigonometry and recursive_trigonometry
const f_cos = fast_trigonometry.f_cos
const f_exp = fast_trigonometry.f_exp
const f_sin = fast_trigonometry.f_sin
const f_factorial = fast_trigonometry.f_factorial

const r_cos = recursive_trigonometry.r_cos
const r_exp = recursive_trigonometry.r_exp
const r_sin = recursive_trigonometry.r_sin
const r_factorial = recursive_trigonometry.r_factorial

# Exporting functions from fast_power and recursive_power
const f_power = fast_power.f_power
const f_sqrt = fast_power.f_sqrt

const r_power = recursive_power.r_power
const r_sqrt = recursive_power.r_sqrt

end
