export hs106

function hs106(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] + x[2] + x[3]
  end
  x0 = T[5000, 5000, 5000, 200, 350, 150, 225, 425]
  lvar = T[100, 1000, 1000, 10, 10, 10, 10, 10]
  uvar = T[10000, 10000, 10000, 1000, 1000, 1000, 1000, 1000]
  function c(x)
    return [
      x[1] * x[6] - 833.33252 * x[4] - 100 * x[1] + 83333.333,
      x[2] * x[7] - 1250 * x[5] - x[2] * x[4] + 1250 * x[4],
      x[3] * x[8] - 1250000 - x[3] * x[5] + 2500 * x[5],
    ]
  end
  lcon = vcat(-ones(T, 3), zeros(T, 3))
  ucon = T(Inf) * ones(T, 6)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 2; 2; 2; 3; 3],
    [4; 6; 5; 7; 4; 8; 5],
    T[-0.0025; -0.0025; -0.0025; -0.0025; 0.0025; -0.01; 0.01],
    c,
    lcon,
    ucon,
    name = "hs106";
    kwargs...,
  )
end
