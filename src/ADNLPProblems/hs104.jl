export hs104 
 
function hs104(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return T(0.4) * (x[1] / x[7])^(T(0.67)) + T(0.4) * (x[2] / x[8])^(T(0.67)) + 10 - x[1] - x[2]
  end
  x0 = T[6, 3, 0.4, 0.2, 6, 6, 1, 0.5]
  lvar = T(0.1) * ones(T, 8)
  uvar = 10 * ones(T, 8)
  function c(x)
    n = length(x)
    return [
      1 - 0.0588 * x[5] * x[7] - 0.1 * x[1],
      1 - 0.0588 * x[6] * x[8] - 0.1 * x[1] - 0.1 * x[2],
      1 - 4 * x[3] / x[5] - 2 * x[3]^(-0.71) / x[5] - 0.0588 * x[3]^(-1.3) * x[7],
      1 - 4 * x[4] / x[6] - 2 * x[4]^(-0.71) / x[6] - 0.0588 * x[4]^(-1.3) * x[8],
      0.4 * (x[1] / x[7])^(0.67) + 0.4 * (x[2] / x[8])^(0.67) + 10 - x[1] - x[2]
    ]
  end
  lcon = vcat(zeros(T, 4), 1)
  ucon = vcat(T(Inf) * ones(T, 4), T(4.2))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs104"; kwargs...)
end
