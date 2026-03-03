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
  
  # Nonlinear constraints:
  # x₁^0.5 * x₂^0.3 * x₃^0.2 * x₄ = 10
  # x₂x₃ - 2x₁ = 0
  function c!(cx, x)
    cx[1] = x[1]^0.5 * x[2]^0.3 * x[3]^0.2 * x[4] - 10
    cx[2] = x[2]*x[3] - 2*x[1]
  end
  
  x0 = T[1.0, 1.0, 1.0, 1.0]
  lvar = T[1e-3, 1e-3, 1e-3, 1e-3]
  uvar = T[Inf, Inf, Inf, Inf]
  lcon = T[5.0, 0.0, 0.0]  # [linear constraint value, nonlinear constraint 1, nonlinear constraint 2]
  ucon = T[5.0, 0.0, 0.0]
  
  # Linear constraint: x₁ + 2x₂ - x₃ = 5 in sparse format
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1],        # row indices
    [1; 2; 3],        # column indices
    T[1; 2; -1],      # coefficients
    c!,
    lcon,
    ucon,
    name = "dembo_gp6";
    kwargs...,
  )
end
