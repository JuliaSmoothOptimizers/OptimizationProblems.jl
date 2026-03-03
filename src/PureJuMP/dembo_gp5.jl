export dembo_gp5

"""
    dembo_gp5()

## Problem
```
    min  -(x₁x₂x₃)
    s.t. x₁ + x₂ - x₃ = 0
         2x₁ + x₂ = 2
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp5(; n = nothing, kwargs...)
  model = Model()
  @variable(model, x[1:3] >= 0.001)
  
  @objective(model, Min, -(x[1]*x[2]*x[3]))
  
  @constraint(model, x[1] + x[2] - x[3] == 0)
  @constraint(model, 2*x[1] + x[2] == 2)
  
  return model
end
