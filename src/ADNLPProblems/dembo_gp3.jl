export dembo_gp3

"""
    dembo_gp3(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP3.

```
    min  x₁ + x₂/x₁ + x₃/x₁² + x₄
    s.t. x₃ - x₁³ = 0
         x₂ - 2x₁² = 0
         x₃ + 1/x₄ = 2
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp3(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1] + x[2]/x[1] + x[3]/x[1]^2 + x[4]
  end
  
  function c!(cx, x)
    cx[1] = x[3] - x[1]^3
    cx[2] = x[2] - 2*x[1]^2
    cx[3] = x[3] + 1/x[4] - 2
  end
  
  x0 = T[1.0, 2.0, 1.0, 1.0]
  lcon = T[0.0, 0.0, 0.0]
  ucon = T[0.0, 0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp3"; kwargs...)
end
