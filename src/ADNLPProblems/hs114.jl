export hs114

function hs114(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = T(0.99)
  b = T(0.9)
  function f(x)
    n = length(x)
    return T(5.04) * x[1] + T(0.035) * x[2] + 10 * x[3] + T(3.36) * x[5] - T(0.063) * x[4] * x[7]
  end
  x0 = T[1745, 12000, 110, 3048, 1974, 89.2, 92.8, 8, 3.6, 145]
  lvar = T[0.00001, 0.00001, 0.00001, 0.00001, 0.00001, 85, 90, 3, 1.2, 145]
  uvar = T[2000, 16000, 120, 5000, 2000, 93, 95, 12, 4, 162]
  function c(x)
    n = length(x)
    g1 = -0.222 * x[10] - b * x[9]
    g2 = 3 * x[7] - a * x[10]
    g5 = 1.12 * x[1] + 0.13167 * x[1] * x[8] - 0.00667 * x[1] * x[8]^2 - a * x[4]
    g6 = 57.425 + 1.098 * x[8] - 0.038 * x[8]^2 + 0.325 * x[6] - a * x[7]
    return [
      1.22 * x[4] - x[1] - x[5],
      g1,
      g2,
      -g1 + x[9] * (1 / b - b),
      -g2 + (1 / a - a) * x[10],
      g5,
      g6,
      -g5 + (1 / a - a) * x[4],
      -g6 + (1 / a - a) * x[7],
      98000 * x[3] / (x[4] * x[9] + 1000 * x[3]) - x[6],
      (x[2] + x[5]) / x[1] - x[8],
    ]
  end
  lcon = vcat(0, -T(35.82), 133, T(35.82), -133, zeros(T, 6))
  ucon = vcat(zero(T), T(Inf) * ones(T, 8), zeros(T, 2))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs114", lin = [1, 2, 3, 4, 5]; kwargs...)
end
