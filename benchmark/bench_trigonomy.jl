using BenchmarkTools
using ScientificCalculator

calc_fast = Calculator(fast_mode=true)
calc_slow = Calculator(fast_mode=false)

calc_fast_m = Calculator(fast_mode=true, terms=20)
calc_slow_m = Calculator(fast_mode=false, terms=20)

calc_fast_l = Calculator(fast_mode=true, terms=50)
calc_slow_l = Calculator(fast_mode=false, terms=50)

x = π / 4

println("Benchmarking Factorial Function:")
println("\n10!:")
@btime factorial!($calc_fast, 10)
@btime factorial!($calc_slow, 10)

println("\n20!:")
@btime factorial!($calc_fast, 20)
@btime factorial!($calc_slow, 20)

println("\n50!:")
@btime factorial!($calc_fast, 150)
@btime factorial!($calc_slow, 150)

println("Benchmarking Sine Function:")
println("\nx = $x")
@btime sin!($calc_fast, $x)
@btime sin!($calc_slow, $x)

println("\nx = $x, terms=20")
@btime sin!($calc_fast_m, $x)
@btime sin!($calc_slow_m, $x)

println("\nx = $x, terms=50")
@btime sin!($calc_fast_l, $x)
@btime sin!($calc_slow_l, $x)

println("Benchmarking Cosine Function:")
println("\nx = $x")
@btime cos!($calc_fast, $x)
@btime cos!($calc_slow, $x)

println("\nx = $x, terms=20")
@btime cos!($calc_fast_m, $x)
@btime cos!($calc_slow_m, $x)

println("\nx = $x, terms=50")
@btime cos!($calc_fast_l, $x)
@btime cos!($calc_slow_l, $x)

println("Benchmarking Exponential Function:")
println("\nx = $x")
@btime exp!($calc_fast, $x)
@btime exp!($calc_slow, $x)

println("\nx = $x, terms=20")
@btime exp!($calc_fast_m, $x)
@btime exp!($calc_slow_m, $x)

println("\nx = $x, terms=50")
@btime exp!($calc_fast_l, $x)
@btime exp!($calc_slow_l, $x)
