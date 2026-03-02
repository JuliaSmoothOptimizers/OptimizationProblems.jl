export dembo_gp5

"""
    dembo_gp5(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP5.

```
    min  -(x₁x₂x₃)
    s.t. x₁ + x₂ - x₃ = 0
         2x₁ + x₂ = 2
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp5(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return -(x[1] * x[2] * x[3])
  end
  
  function c!(cx, x)
    cx[1] = x[1] + x[2] - x[3]
    cx[2] = 2*x[1] + x[2] - 2
  end
  
  x0 = T[0.5, 1.0, 1.5]
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp5"; kwargs...)
end
