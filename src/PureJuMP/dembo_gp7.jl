export dembo_gp7

"""
    dembo_gp7()

The Dembo geometric programming problem GP7.

## Problem
```
    min  x₁² + x₂² + x₃² + x₄²
    s.t. x₁x₂x₃ - 1 = 0
         x₁ + x₂ + x₃² = 0
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp7()
  model = Model()
  @variable(model, x[1:4])
  
  @objective(model, Min, x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2)
  
  @constraint(model, x[1]*x[2]*x[3] == 1)
  @constraint(model, x[1] + x[2] + x[3]^2 == 0)
  
  return model
end
