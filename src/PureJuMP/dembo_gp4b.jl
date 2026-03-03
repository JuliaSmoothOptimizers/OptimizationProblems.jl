export dembo_gp4b

"""
    dembo_gp4b()

The Dembo geometric programming problem GP4b.

## Problem
```
    min  -(x₁x₂x₃x₄x₅)
    s.t. 2x₁ + 3x₂ + x₃ + 4x₄ + x₅ = 20
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp4b()
  model = Model()
  @variable(model, x[1:5] >= 0.001)
  
  @objective(model, Min, -(x[1]*x[2]*x[3]*x[4]*x[5]))
  
  @constraint(model, 2*x[1] + 3*x[2] + x[3] + 4*x[4] + x[5] == 20)
  
  return model
end
