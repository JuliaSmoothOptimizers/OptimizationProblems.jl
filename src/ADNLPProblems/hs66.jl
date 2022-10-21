export hs66

function hs66(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2 // 10 * x[3] - 8 // 10 * x[1]
  end
  x0 = T[0, 1.05, 2.9]
  uvar = T[100, 100, 10]
  lvar = zeros(T, 3)
  function c(x)
    n = length(x)
    return [x[2] - exp(x[1]), x[3] - exp(x[2])]
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs66"; kwargs...)
end
