export hs24

function hs24(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 / T(27 * sqrt(3)) * ((x[1] - 3)^2 - 9) * x[2]^3
  end
  x0 = T[1, 0.5]
  lvar = zeros(T, 2)
  uvar = T(Inf) * ones(T, 2)
  function c(x)
    n = length(x)
    return [x[1] / sqrt(3) - x[2], x[1] + sqrt(3) * x[2]]
  end
  lcon = zeros(T, 2)
  ucon = T[Inf, 6]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs24"; kwargs...)
end
