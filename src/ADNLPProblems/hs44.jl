export hs44 
 
function hs44(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] - x[2] - x[3] - x[1] * x[3] + x[1] * x[4] + x[2] * x[3] - x[2] * x[4]
  end
  x0 = zeros(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  function c(x)
    n = length(x)
    return [
      -8 + x[1] + 2 * x[2],
      -12 + 4 * x[1] + x[2],
      -12 + 3 * x[1] + 4 * x[2],
      -8 + 2 * x[3] + x[4],
      -8 + x[3] + 2 * x[4],
      -5 + x[3] + x[4]
    ]
  end
  lcon = -T(Inf) * ones(T, 6)
  ucon = zeros(T, 6)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs44"; kwargs...)
end
