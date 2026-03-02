export dembo_gp1b

"""
    dembo_gp1b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP1b.

```
    min  exp(x₁) + exp(x₂)
    s.t. exp(x₁) * exp(x₂) ≥ 1
```

Variant form of problem GP1, equivalent to x₁ + x₂ ≥ log(1) = 0.

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp1b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return exp(x[1]) + exp(x[2])
  end
  
  function c!(cx, x)
    cx[1] = exp(x[1]) * exp(x[2])
  end
  
  x0 = T[0.0, 0.0]
  lcon = T[1.0]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "dembo_gp1b"; kwargs...)
end
