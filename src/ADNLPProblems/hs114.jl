export hs114

function hs114(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = T(0.99)
  b = T(0.9)
  function f(x)
    n = length(x)
    return 504 // 100 * x[1] + 35 // 1000 * x[2] + 10 * x[3] + 336 // 100 * x[5] - 63 // 1000 * x[4] * x[7]
  end
  x0 = T[1745, 12000, 110, 3048, 1974, 89.2, 92.8, 8, 3.6, 145]
  lvar = T[0.00001, 0.00001, 0.00001, 0.00001, 0.00001, 85, 90, 3, 1.2, 145]
  uvar = T[2000, 16000, 120, 5000, 2000, 93, 95, 12, 4, 162]
  function c(x)
    g5 = 1.12 * x[1] + 0.13167 * x[1] * x[8] - 0.00667 * x[1] * x[8]^2 - a * x[4]
    g6 = 57.425 + 1.098 * x[8] - 0.038 * x[8]^2 + 0.325 * x[6] - a * x[7]
    return [
      g5,
      g6,
      -g5 + (1 / a - a) * x[4],
      -g6 + (1 / a - a) * x[7],
      98000 * x[3] / (x[4] * x[9] + 1000 * x[3]) - x[6],
      (x[2] + x[5]) / x[1] - x[8],
    ]
  end
  lcon = vcat(0, -T(35.82), 133, T(35.82), -133, zeros(T, 6))
  ucon = vcat(zero(T), T(Inf) * ones(T, 8), zeros(T, 2))
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1; 2; 2; 3; 3; 4; 4; 4; 5; 5; 5],
    [4; 1; 5; 10; 9; 7; 10; 10; 9; 9; 7; 10; 10],
    T[1.22; -1; -1; -0.222; -b; 3; -a; 0.222; b; 1 / b - b; -3; a; 1 / a - a],
    c,
    lcon,
    ucon,
    name = "hs114";
    kwargs...,
  )
end
