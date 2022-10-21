export hs93

function hs93(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 204 // 10000 * x[1] * x[4] * (x[1] + x[2] + x[3]) +
           187 // 10000 * x[2] * x[3] * (x[1] + 157 // 100 * x[2] + x[4]) +
           607 // 10000 * x[1] * x[4] * x[5]^2 * (x[1] + x[2] + x[3]) +
           437 // 10000 * x[2] * x[3] * x[6]^2 * (x[1] + 157 // 100 * x[2] + x[4])
  end
  x0 = T[5.54, 4.4, 12.02, 11.82, 0.702, 0.852]
  lvar = zeros(T, 6)
  uvar = T(Inf) * ones(T, 6)
  function c(x)
    n = length(x)
    return [
      1 // 1000 * prod(x[i] for i = 1:6) - 207 // 100,
      1 - 62 // 100000 * x[1] * x[4] * x[5]^2 * (x[1] + x[2] + x[3]) -
      58 // 100000 * x[2] * x[3] * x[6]^2 * (x[1] + 157 // 100 * x[2] + x[4]),
    ]
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs93"; kwargs...)
end
