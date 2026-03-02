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
    return T(70.5)*x[1] + T(13.5)*x[2] + T(56)*x[3] + T(47)*x[4] + T(50.5)*x[5] - T(19)*x[6] - T(15)*x[7]
  end
  
  x0 = T[0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
  # All linear constraints in sparse format:
  # Row 1: x₁ + x₅ + x₆ - 0.5x₇ ≥ 1
  # Row 2: x₁ + x₂ + x₃ + x₅ - x₇ ≥ 2
  # Row 3: x₁ + 2x₂ + x₃ + x₄ - x₆ - 2x₇ ≥ 1
  # Row 4: x₃ + 3x₄ + x₅ + 2x₆ ≥ 1
  lcon = T[1.0, 2.0, 1.0, 1.0]
  ucon = T[Inf, Inf, Inf, Inf]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1; 1; 1; 1; 2; 2; 2; 2; 2; 3; 3; 3; 3; 3; 3; 4; 4; 4; 4],  # row indices
    [1; 5; 6; 7; 1; 2; 3; 5; 7; 1; 2; 3; 4; 6; 7; 3; 4; 5; 6],  # column indices
    T[1; 1; 1; -0.5; 1; 1; 1; 1; -1; 1; 2; 1; 1; -1; -2; 1; 3; 1; 2], # coefficients
    lcon,
    ucon,
    name = "dembo_gp8a";
    kwargs...,
  )
end
