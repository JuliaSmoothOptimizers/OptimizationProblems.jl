export dembo_gp1b

"""
    dembo_gp1b()

## Problem
```
    min  exp(x₁) + exp(x₂)
    s.t. x₁ + x₂ >= log(2)
```

Variant form of problem GP1, with constraints using a different parameterization.

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp1b()
  model = Model()
  @variable(model, x[1:2])
  
  @objective(model, Min, exp(x[1]) + exp(x[2]))
  @constraint(model, exp(x[1]) * exp(x[2]) >= 1)
  
  return model
end
