export hs76 
 
function hs76(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + T(0.5) * x[2]^2 + x[3]^2 + T(0.5) * x[4]^2 - x[1] * x[3] + x[3] * x[4] - x[1] - 3 * x[2] +
    x[3] - x[4]
  end
  x0 = T(0.5) * ones(T, 4)
  lvar = zeros(T, 4)
  uvar = T(Inf) * ones(T, 4)
  function c(x)
    n = length(x)
    return [
      -5 + x[1] + 2 * x[2] + x[3] + x[4],
      -4 + 3 * x[1] + x[2] + 2 * x[3] - x[4],
      - x[2] - 4 * x[3] + 1.5
    ]
  end
  lcon = -T(Inf) * ones(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs76"; kwargs...)
end
