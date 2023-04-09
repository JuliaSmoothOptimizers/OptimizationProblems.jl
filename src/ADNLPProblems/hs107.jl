export hs107

function hs107(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = T((48.4 / 50.176) * sin(0.25))
  d = T((48.4 / 50.176) * cos(0.25))
  function f(x)
    n = length(x)
    return 3000 * x[1] + 1000 * x[1]^3 + 2000 * x[2] + 666667 // 1000 * x[2]^3
  end
  x0 = T[0.8, 0.8, 0.2, 0.2, 1.0454, 1.0454, 1.0454, 0, 0]
  lvar = T[0, 0, -Inf, -Inf, 0.90909, 0.90909, 0.90909, -Inf, -Inf]
  uvar = T[Inf, Inf, Inf, Inf, 1.0909, 1.0909, 1.0909, Inf, Inf]
  function c!(cx, x)
    y1 = sin(x[8])
    y2 = cos(x[8])
    y3 = sin(x[9])
    y4 = cos(x[9])
    y5 = sin(x[8] - x[9])
    y6 = cos(x[8] - x[9])
    cx[1] =
      0.4 - x[1] + 2 * ci * x[5]^2 - x[5] * x[6] * (d * y1 + ci * y2) -
      x[5] * x[7] * (d * y3 + ci * y4)
    cx[2] =
      0.4 - x[2] +
      2 * ci * x[6]^2 +
      x[5] * x[6] * (d * y1 - ci * y2) +
      x[6] * x[7] * (d * y5 - ci * y6)
    cx[3] =
      0.8 + 2 * ci * x[7]^2 + x[5] * x[7] * (d * y3 - ci * y4) - x[6] * x[7] * (d * y5 + ci * y6)
    cx[4] =
      0.2 - x[3] +
      2 * d * x[5]^2 +
      x[5] * x[6] * (ci * y1 - d * y2) +
      x[5] * x[7] * (ci * y3 - d * y4)
    cx[5] =
      0.2 - x[4] + 2 * d * x[6]^2 - x[5] * x[6] * (ci * y1 + d * y2) -
      x[6] * x[7] * (ci * y5 + d * y6)
    cx[6] =
      -0.337 + 2 * d * x[7]^2 - x[5] * x[7] * (ci * y3 + d * y4) + x[6] * x[7] * (ci * y5 - d * y6)
    return cx
  end
  lcon = zeros(T, 6)
  ucon = zeros(T, 6)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs107"; kwargs...)
end
