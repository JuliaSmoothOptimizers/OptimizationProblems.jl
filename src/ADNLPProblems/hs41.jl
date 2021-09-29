export hs41

function hs41(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2 - x[1] * x[2] * x[3]
  end
  x0 = 2 * ones(T, 4)
  lvar = zeros(T, 4)
  uvar = T[1, 1, 1, 2]
  function c(x)
    n = length(x)
    return [x[1] + 2 * x[2] + 2 * x[3] - x[4]]
  end
  lcon = zeros(T, 1)
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs41"; kwargs...)
end
