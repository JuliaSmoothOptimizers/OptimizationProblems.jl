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
  
  x0 = T[0.5, 1.0, 1.5]
  # Linear constraints in sparse format:
  # x₁ + x₂ - x₃ = 0  (row 1)
  # 2x₁ + x₂ = 2       (row 2)
  lcon = T[0.0, 2.0]
  ucon = T[0.0, 2.0]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1; 1; 2; 2],  # row indices
    [1; 2; 3; 1; 2],  # column indices
    T[1; 1; -1; 2; 1], # coefficients
    lcon,
    ucon,
    name = "dembo_gp5";
    kwargs...,
  )
end
