export hs98

function hs98(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return T(4.3) * x[1] +
           T(31.8) * x[2] +
           T(63.3) * x[3] +
           T(15.8) * x[4] +
           T(68.5) * x[5] +
           T(4.7) * x[6]
  end
  x0 = zeros(T, 6)
  lvar = zeros(T, 6)
  uvar = T[0.31, 0.046, 0.068, 0.042, 0.028, 0.0134]
  function c(x)
    n = length(x)
    return [
      17.1 * x[1] + 38.2 * x[2] + 204.2 * x[3] + 212.3 * x[4] + 623.4 * x[5] + 1495.5 * x[6] -
      169 * x[1] * x[3] - 3580 * x[3] * x[5] - 3810 * x[4] * x[5] - 18500 * x[4] * x[6] -
      24300 * x[5] * x[6] - 32.97,
      17.9 * x[1] + 36.8 * x[2] + 113.9 * x[3] + 169.7 * x[4] + 337.8 * x[5] + 1385.2 * x[6] -
      139 * x[1] * x[3] - 2450 * x[4] * x[5] - 16600 * x[4] * x[6] - 17200 * x[5] * x[6] - 25.12,
      -273 * x[2] - 70 * x[4] - 819 * x[5] + 26000 * x[4] * x[5] + 124.08,
      159.9 * x[1] - 311 * x[2] + 587 * x[4] + 391 * x[5] + 2198 * x[6] - 14000 * x[1] * x[6] +
      173.02,
    ]
  end
  lcon = zeros(T, 4)
  ucon = T(Inf) * ones(T, 4)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs98"; kwargs...)
end
