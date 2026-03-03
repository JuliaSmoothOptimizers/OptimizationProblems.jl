export dembo_gp1a

"""
    dembo_gp1a()

## Problem
```
    min  exp(x₁) + exp(x₂)
    s.t. x₁ + x₂ >= log(2)
```

## Solution
x* = [log(2)/2; log(2)/2], f* = 2sqrt(2)

## Reference
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp1a()
  model = Model()
  @variable(model, x[1:2], start = 0.0)
  
  @objective(model, Min, exp(x[1]) + exp(x[2]))
  @constraint(model, x[1] + x[2] >= log(2))
  
  return model
end
