export hs112

function hs112(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  ci = [
    -6089 // 1000,
    -17164 // 1000,
    -34054 // 1000,
    -5914 // 1000,
    -24721 // 1000,
    -14986 // 1000,
    -24100 // 1000,
    -10708 // 1000,
    -26662 // 1000,
    -22179 // 1000,
  ]
  function f(x; ci = ci)
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
