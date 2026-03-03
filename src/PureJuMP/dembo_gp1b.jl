export dembo_gp1b

"""
    dembo_gp1b()

## Problem
```
    min  exp(x₁) + exp(x₂)
    s.t. exp(x₁) * exp(x₂) >= 1
```

Variant form of problem GP1, equivalent to x₁ + x₂ >= log(1) = 0.

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp1b()
  model = Model()
  @variable(model, x[1:2], start = 0.0)
  
  @objective(model, Min, exp(x[1]) + exp(x[2]))
  @constraint(model, exp(x[1]) * exp(x[2]) >= 1)
  
  return model
end
