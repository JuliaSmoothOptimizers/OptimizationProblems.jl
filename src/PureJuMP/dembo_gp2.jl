export dembo_gp2

"""
    dembo_gp2()

## Problem
```
    min  x₁ + 2/x₁ + 2x₂ + x₃ 
    s.t. x₁x₂ - 1 = 0
         x₂ + 1/x₃ - 2 = 0
```

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp2()
  model = Model()
  @variable(model, x[1:3] >= 0.001)
  
  @objective(model, Min, x[1] + 2/x[1] + 2*x[2] + x[3])
  
  @constraint(model, x[1]*x[2] == 1)
  @constraint(model, x[2] + 1/x[3] == 2)
  
  return model
end
