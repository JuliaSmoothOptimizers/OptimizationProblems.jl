export hs112

function hs112(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = T[-6.089, -17.164, -34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]
  function f(x)
    n = length(x)
    return sum(x[j] * (ci[j] + log(x[j] / (sum(x[k] for k = 1:10)))) for j = 1:10)
  end
  x0 = T(0.1) * ones(T, 10)
  lvar = T(1.0e-6) * ones(T, 10)
  uvar = T(Inf) * ones(T, 10)
  function c(x)
    n = length(x)
    return [
      x[1] + 2 * x[2] + 2 * x[3] + x[6] + x[10],
      x[4] + 2 * x[5] + x[6] + x[7],
      x[3] + x[7] + x[8] + 2 * x[9] + x[10],
    ]
  end
  lcon = T[2, 1, 1]
  ucon = T[2, 1, 1]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    lcon,
    ucon,
    name = "hs112",
    lin = [1, 2, 3];
    kwargs...,
  )
end
