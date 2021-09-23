export hs53 
 
function hs53(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2
  end
  x0 = 2 * ones(T, 5)
  lvar = -10 * ones(T, 5)
  uvar = 10 * ones(T, 5)
  function c(x)
    n = length(x)
    return [x[1] + 3 * x[2], x[3] + x[4] - 2 * x[5], x[2] - x[5]]
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs53"; kwargs...)
end
