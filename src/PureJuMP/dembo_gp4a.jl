export dembo_gp4a

"""
    dembo_gp4a()

The Dembo geometric programming problem GP4a.

## Problem
```
    min  -(x₁x₂x₃x₄x₅)
    s.t. x₁ + x₂ + x₃ + x₄ + x₅ = 5
         (x₁² + x₂² + x₃² + x₄² + x₅²) - 5 = 0
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp4a(; n = nothing, kwargs...)
  model = Model()
  @variable(model, x[1:5] >= 0.001)
  
  @objective(model, Min, -(x[1]*x[2]*x[3]*x[4]*x[5]))
  
  @constraint(model, sum(x) == 5)
  @constraint(model, sum(x[i]^2 for i=1:5) == 5)
  
  return model
end
