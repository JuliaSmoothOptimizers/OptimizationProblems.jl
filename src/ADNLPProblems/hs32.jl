export hs32

function hs32(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] + 3 * x[2] + x[3])^2 + 4 * (x[1] - x[2])^2
  end
  x0 = T[0.1, 0.7, 0.2]
  lvar = zeros(T, 3)
  uvar = T(Inf) * ones(T, 3)
  function c(x)
    n = length(x)
    return [x[1] + x[2] + x[3], 6 * x[2] + 4 * x[3] - x[1]^3 - 3]
  end
  lcon = T[1, 0]
  ucon = T[1, Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs32"; kwargs...)
end
