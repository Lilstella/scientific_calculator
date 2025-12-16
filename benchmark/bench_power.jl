using BenchmarkTools
using scientific_calculator

calc_fast = Calculator(fast_mode=true)
calc_slow = Calculator(fast_mode=false)

x_1 = 12.0
x_2 = 33.0

x_1_neg = 12.0
x_2_neg = -33.0

println("Benchmarking Power Function:")
println("\n12^11:")

@btime power!($calc_fast, $x_1, 11)
@btime power!($calc_slow, $x_1, 11)

println("\n33^25:")
@btime power!($calc_fast, $x_2, 25)
@btime power!($calc_slow, $x_2, 25)

println("\n12^-4:")
@btime power!($calc_fast, $x_1_neg, -4)
@btime power!($calc_slow, $x_1_neg, -4)

println("\n33^-10:")
@btime power!($calc_fast, $x_2_neg, -10)
@btime power!($calc_slow, $x_2_neg, -10)