export hs21

function hs21(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return T(0.01) * x[1]^2 + x[2]^2 - 100
  end
  x0 = -ones(T, 2)
  lvar = T[2, -50]
  uvar = T[50, 50]
  function c(x)
    n = length(x)
    return [10 * x[1] - x[2]]
  end
  lcon = 10 * ones(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs21"; kwargs...)
end
