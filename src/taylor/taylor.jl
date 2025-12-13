module taylor

include("fast/trigonometry.jl")
include("recursive/trigonometry.jl")

using .fast_trigonometry
using .recursive_trigonometry

export f_cos, f_exp, f_sin, f_factorial,
       r_cos, r_exp, r_sin, r_factorial

const f_cos = fast_trigonometry.f_cos
const f_exp = fast_trigonometry.f_exp
const f_sin = fast_trigonometry.f_sin
const f_factorial = fast_trigonometry.f_factorial

const r_cos = recursive_trigonometry.r_cos
const r_exp = recursive_trigonometry.r_exp
const r_sin = recursive_trigonometry.r_sin
const r_factorial = recursive_trigonometry.r_factorial

end
