export dembo_gp3

"""
    dembo_gp3()

## Problem
```
    min  x₁ + x₂/x₁ + x₃/x₁² + x₄
    s.t. x₃ - x₁³ = 0
         x₂ - 2x₁² = 0
         x₃ + 1/x₄ = 2
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp3()
  model = Model()
  @variable(model, x[1:4] >= 0.001)
  
  @objective(model, Min, x[1] + x[2]/x[1] + x[3]/x[1]^2 + x[4])
  
  @constraint(model, x[3] - x[1]^3 == 0)
  @constraint(model, x[2] - 2*x[1]^2 == 0)
  @constraint(model, x[3] + 1/x[4] == 2)
  
  return model
end
