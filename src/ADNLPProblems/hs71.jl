export hs71

function hs71(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] * x[4] * (x[1] + x[2] + x[3]) + x[3]
  end
  x0 = T[1, 5, 5, 1]
  lvar = ones(T, 4)
  uvar = 5 * ones(T, 4)
  function c(x)
    n = length(x)
    return [x[1] * x[2] * x[3] * x[4] - 25, x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40]
  end
  lcon = zeros(T, 2)
  ucon = [T(Inf), zero(T)]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs71"; kwargs...)
end
