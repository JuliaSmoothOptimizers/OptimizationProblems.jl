export dembo_gp1a

"""
    dembo_gp1a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP1a.

```
    min  exp(x₁) + exp(x₂)
    s.t. x₁ + x₂ ≥ log(2)
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp1a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return exp(x[1]) + exp(x[2])
  end
  
  x0 = T[0.0, 0.0]
  # Linear constraint: x₁ + x₂ >= log(2) in sparse format
  lcon = T[log(T(2))]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1],      # row indices
    [1; 2],      # column indices
    T[1; 1],     # values (both 1)
    lcon,
    ucon,
    name = "dembo_gp1a";
    kwargs...,
  )
end
