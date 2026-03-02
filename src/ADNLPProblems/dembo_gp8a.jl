export dembo_gp8a

"""
    dembo_gp8a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP8a.

```
    min    70.5x₁ + 13.5x₂ + 56x₃ + 47x₄ + 50.5x₅ - 19x₆ - 15x₇
    s.t.   x₁ + x₅ + x₆ - 0.5x₇ ≥ 1
           x₁ + x₂ + x₃ + x₅ - x₇ ≥ 2
           x₁ + 2x₂ + x₃ + x₄ - x₆ - 2x₇ ≥ 1
           x₃ + 3x₄ + x₅ + 2x₆ ≥ 1
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp8a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 70.5*x[1] + 13.5*x[2] + 56*x[3] + 47*x[4] + 50.5*x[5] - 19*x[6] - 15*x[7]
  end
  
  function c!(cx, x)
    cx[1] = x[1] + x[5] + x[6] - 0.5*x[7]
    cx[2] = x[1] + x[2] + x[3] + x[5] - x[7]
    cx[3] = x[1] + 2*x[2] + x[3] + x[4] - x[6] - 2*x[7]
    cx[4] = x[3] + 3*x[4] + x[5] + 2*x[6]
  end
  
  x0 = T[0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
  lcon = T[1.0, 2.0, 1.0, 1.0]
  ucon = T[Inf, Inf, Inf, Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp8a"; kwargs...)
end
