export dembo_gp4a

"""
    dembo_gp4a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP4a.

```
    min  -(x₁x₂x₃x₄x₅)
    s.t. x₁ + x₂ + x₃ + x₄ + x₅ = 5
         x₁² + x₂² + x₃² + x₄² + x₅² = 5
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp4a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return -(x[1] * x[2] * x[3] * x[4] * x[5])
  end
  
  # Nonlinear constraint: x₁² + x₂² + x₃² + x₄² + x₅² = 5
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[5]^2 - 5
  end
  
  x0 = T[1.0, 1.0, 1.0, 1.0, 1.0]
  lcon = T[5.0, 0.0]  # [linear constraint value, nonlinear constraint value]
  ucon = T[5.0, 0.0]
  
  # Linear constraint: x₁ + x₂ + x₃ + x₄ + x₅ = 5 in sparse format
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    [1; 1; 1; 1; 1],  # row indices
    [1; 2; 3; 4; 5],  # column indices
    T[1; 1; 1; 1; 1], # coefficients
    c!,
    lcon,
    ucon,
    name = "dembo_gp4a";
    kwargs...,
  )
end
