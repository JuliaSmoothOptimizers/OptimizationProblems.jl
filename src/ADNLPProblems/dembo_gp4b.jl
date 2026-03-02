export dembo_gp4b

"""
    dembo_gp4b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T

The Dembo geometric programming problem GP4b.

```
    min   -(x₁x₂x₃x₄x₅)
    s.t.  2x₁ + 3x₂ + x₃ + 4x₄ + x₅ = 20
```

## Origin
Dembo, Ron S. A set of geometric programming test problems and their solutions.
Mathematical Programming 10.1 (1976): 192-213.
"""
function dembo_gp4b(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where T
  x0 = ones(T, 5)

  function f(x)
    return -(x[1] * x[2] * x[3] * x[4] * x[5])
  end

  function c!(cx, x)
    cx[1] = 2 * x[1] + 3 * x[2] + x[3] + 4 * x[4] + x[5] - 20
  end

  return ADNLPModel!(f, x0, c!, [20.0], [20.0], name = "dembo_gp4b")
end
