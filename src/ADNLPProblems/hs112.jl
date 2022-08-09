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
  lcon = T[2, 1, 1]
  ucon = T[2, 1, 1]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1; 1; 1; 2; 2; 2; 2; 3; 3; 3; 3; 3],
    [1; 2; 3; 6; 10; 4; 5; 6; 7; 3; 7; 8; 9; 10],
    T[1; 2; 2; 1; 1; 1; 2; 1; 1; 1; 1; 1; 2; 1],
    lcon,
    ucon,
    name = "hs112";
    kwargs...,
  )
end
