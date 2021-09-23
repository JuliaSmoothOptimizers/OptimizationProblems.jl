export hs23 
 
function hs23(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]^2
  end
  x0 = T[3, 1]
  lvar = -50 * ones(T, 2)
  uvar = 50 * ones(T, 2)
  function c(x)
    n = length(x)
    return [x[1] + x[2] - 1, x[1]^2 + x[2]^2 - 1, 9 * x[1]^2 + x[2]^2 - 9, x[1]^2 - x[2], x[2]^2 - x[1]]
  end
  lcon = zeros(T, 5)
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs23"; kwargs...)
end
