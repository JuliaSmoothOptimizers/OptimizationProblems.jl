export hs60 
 
function hs60(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^4
  end
  x0 = 2 * ones(T, 3)
  lvar = -10 * ones(T, 3)
  uvar = 10 * ones(T, 3)
  function c(x)
    n = length(x)
    return [x[1] * (1 + x[2]^2) + x[3]^4 - 4 - 3 * sqrt(2)]
  end
  lcon = zeros(T, 1)
  ucon = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs60"; kwargs...)
end
