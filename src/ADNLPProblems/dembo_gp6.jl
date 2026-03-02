export dembo_gp6

"""
    dembo_gp6(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP6.

```
    min  x₁ + x₂ + x₃ + x₄
    s.t. x₁^0.5 * x₂^0.3 * x₃^0.2 * x₄ = 10
         x₁ + 2x₂ - x₃ = 5
         x₂x₃ - 2x₁ = 0
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp6(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[1] + x[2] + x[3] + x[4]
  end
  
  function c!(cx, x)
    cx[1] = x[1]^0.5 * x[2]^0.3 * x[3]^0.2 * x[4] - 10
    cx[2] = x[1] + 2*x[2] - x[3] - 5
    cx[3] = x[2]*x[3] - 2*x[1]
  end
  
  x0 = T[1.0, 1.0, 1.0, 1.0]
  lcon = T[0.0, 0.0, 0.0]
  ucon = T[0.0, 0.0, 0.0]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp6"; kwargs...)
end
