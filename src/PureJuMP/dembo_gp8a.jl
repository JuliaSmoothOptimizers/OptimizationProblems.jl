export dembo_gp8a

"""
    dembo_gp8a()

The Dembo geometric programming problem GP8a.

## Problem
```
    min    70.5x₁ + 13.5x₂ + 56x₃ + 47x₄ + 50.5x₅ - 19x₆ - 15x₇
    s.t.   x₁ + x₅ + x₆ - 0.5x₇ >= 1
           x₁ + x₂ + x₃ + x₅ - x₇ >= 2
           x₁ + 2x₂ + x₃ + x₄ - x₆ - 2x₇ >= 1
           x₃ + 3x₄ + x₅ + 2x₆ >= 1
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp8a(; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[1:7] >= 0, start = 0.5)
  
  @objective(model, Min, 70.5*x[1] + 13.5*x[2] + 56*x[3] + 47*x[4] + 50.5*x[5] - 19*x[6] - 15*x[7])
  
  @constraint(model, x[1] + x[5] + x[6] - 0.5*x[7] >= 1)
  @constraint(model, x[1] + x[2] + x[3] + x[5] - x[7] >= 2)
  @constraint(model, x[1] + 2*x[2] + x[3] + x[4] - x[6] - 2*x[7] >= 1)
  @constraint(model, x[3] + 3*x[4] + x[5] + 2*x[6] >= 1)
  
  return model
end
