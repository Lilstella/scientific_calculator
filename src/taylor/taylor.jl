module taylor

include("fast.jl")
include("recursive.jl")

using .fast
using .recursive

export f_cos, f_exp, f_sin, f_factorial,
       r_cos, r_exp, r_sin, r_factorial

const f_cos = fast.f_cos
const f_exp = fast.f_exp
const f_sin = fast.f_sin
const f_factorial = fast.f_factorial

const r_cos = recursive.r_cos
const r_exp = recursive.r_exp
const r_sin = recursive.r_sin
const r_factorial = recursive.r_factorial

end
