export dembo_gp6

"""
    dembo_gp6()

## Problem
```
    min  x₁ + x₂ + x₃ + x₄
    s.t. x₁^0.5 * x₂^0.3 * x₃^0.2 * x₄ = 10
         x₁ + 2x₂ - x₃ = 5
         x₂x₃ - 2x₁ = 0
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp6()
  model = Model()
  @variable(model, x[1:4] >= 0.001)
  
  @objective(model, Min, x[1] + x[2] + x[3] + x[4])
  
  @constraint(model, x[1]^0.5 * x[2]^0.3 * x[3]^0.2 * x[4] == 10)
  @constraint(model, x[1] + 2*x[2] - x[3] == 5)
  @constraint(model, x[2]*x[3] - 2*x[1] == 0)
  
  return model
end
