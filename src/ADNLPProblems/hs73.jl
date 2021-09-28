export hs73 
 
function hs73(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return T(24.55) * x[1] + T(26.75) * x[2] + 39 * x[3] + T(40.50) * x[4]
  end
  x0 = ones(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  function c(x)
    n = length(x)
    return [
      x[1] + x[2] + x[3] + x[4],
      2.3 * x[1] + 5.6 * x[2] + 11.1 * x[3] + 1.3 * x[4],
      12 * x[1] + 11.9 * x[2] + 41.8 * x[3] + 52.1 * x[4] - 21 -
      1.645 * sqrt(0.28x[1]^2 + 0.19 * x[2]^2 + 20.5 * x[3]^2 + 0.62x[4]^2),
    ]
  end
  lcon = T[1, 5, 0]
  ucon = vcat(one(T), T(Inf), T(Inf))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs73"; kwargs...)
end
