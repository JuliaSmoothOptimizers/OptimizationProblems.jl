export dembo_gp7

"""
    dembo_gp7(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP7.

```
    min  x₁² + x₂² + x₃² + x₄²
    s.t. x₁x₂x₃ = 1
         x₁ + x₂ + x₃² = 0
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp7(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2
  end
  
  function c!(cx, x)
    cx[1] = x[1]*x[2]*x[3] - 1
    cx[2] = x[1] + x[2] + x[3]^2
  end
  
  x0 = T[-1.0, 1.0, 1.0, 1.0]
  lcon = T[0.0, 0.0]
  ucon = T[0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp7"; kwargs...)
end
