# Scientific Calculator (Julia)

A **high‑performance scientific calculator implemented in Julia**.  
The project implements common mathematical functions using **Taylor series**, with built‑in benchmarking and testing.

---

## ✨ Features

-Basic operations:
  - Summation (`+`)
  - Subtraction (`-`)
  - Multiplication (`*`)
  - Division (`/`)
- Factorial (`n!`)
- Trigonometric functions:
  - Sine (`sin`)
  - Cosine (`cos`)
- Exponential (`exp`)
- Two computation modes:
  - **iterative mode** (fast and optimized)
  - **Recursive mode** (slower but educational)
- Configurable Taylor series precision
- Zero heap allocations in fast mode
- Integrated benchmarks using `BenchmarkTools`

---

## 📂 Project Structure

```
scientific_calculator/
├── src/
│   └── scientific_calculator.jl
├── benchmark/
│   └── bench_taylor.jl
├── test/
│   └── runtests.jl
├── Project.toml
├── Manifest.toml
└── README.md
```

---

## 🚀 Installation & Setup

Clone the repository and instantiate the environment:

```bash
julia --project=. -e "import Pkg; Pkg.instantiate()"
```

This will install all required dependencies (including `BenchmarkTools`).

---

## 🧮 Usage

### Creating a Calculator

```julia
using ScientificCalculator

calc = Calculator(Float64; fast_mode=true, terms=20)
```

- `fast_mode = true` > optimized iterative algorithms
- `fast_mode = false` > recursive (educational) algorithms
- `terms` > number of Taylor series terms

---

### Factorial

```julia
factorial!(calc, 10)
println(calc.value)  # 3628800
```

---

### Sine & Cosine

```julia
sin!(calc, π/4)
println(calc.value)

cos!(calc, π/4)
println(calc.value)
```

---

### Exponential

```julia
exp!(calc, 1.0)
println(calc.value)
```

---

### Changing Precision

```julia
precision!(calc, 50)
```

---

## ⚡ Performance

Benchmarks are implemented using `BenchmarkTools`.

Run them with:

```bash
julia --project=. benchmark/bench_taylor.jl
```

### Sample Results (Fast vs Recursive)

| Function | Terms | Fast | Recursive |
|--------|------|------|-----------|
| `sin(π/4)` | 20 | ~26 ns | ~1.6 μs |
| `sin(π/4)` | 50 | ~62 ns | ~9.7 μs |
| `exp(0.78)` | 50 | ~58 ns | ~5.0 μs |

---

## 🧪 Testing

Run the test suite with:

```bash
julia --project=. -e "import Pkg; Pkg.test()"
```

Tests validate:
- Numerical correctness
- Consistency with Julia `Base` functions
- API stability

---


