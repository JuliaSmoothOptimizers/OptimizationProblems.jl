export hs116

function hs116(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  a = 0.002
  b = 1.262626
  ci = 1.231059
  d = 0.03475
  e = 0.975
  fi = 0.00975
  function f(x)
    n = length(x)
    return x[11] + x[12] + x[13]
  end
  x0 = T[0.5, 0.8, 0.9, 0.1, 0.14, 0.5, 489, 80, 650, 450, 150, 150, 150]
  lvar = T[0.1, 0.1, 0.1, 0.0001, 0.1, 0.1, 0.1, 0.1, 500, 0.1, 1, 0.0001, 0.0001]
  uvar = T[1, 1, 1, 0.1, 0.9, 0.9, 1000, 1000, 1000, 500, 150, 150, 150]
  function c!(cx, x)
    cx[1] = x[13] - b * x[10] + ci * x[3] * x[10]
    cx[2] = x[5] - d * x[2] - e * x[2] * x[5] + fi * x[2]^2
    cx[3] = x[6] - d * x[3] - e * x[3] * x[6] + fi * x[3]^2
    cx[4] = x[4] - d * x[1] - e * x[1] * x[4] + fi * x[1]^2
    cx[5] = x[12] - b * x[9] + ci * x[2] * x[9]
    cx[6] = x[11] - b * x[8] + ci * x[1] * x[8]
    cx[7] = x[5] * x[7] - x[1] * x[8] - x[4] * x[7] + x[4] * x[8]
    cx[8] = - a * (x[2] * x[9] + x[5] * x[8] - x[1] * x[8] - x[6] * x[9]) - x[5] - x[6]
    cx[9] = x[2] * x[9] - x[3] * x[10] - x[6] * x[9] - 500 * x[2] + 500 * x[6] + x[2] * x[10]
    cx[10] = x[2] - a * (x[2] * x[10] - x[3] * x[10])
    return cx
  end
  lcon = vcat(zeros(T, 2), -1, 50, -T(Inf), zeros(T, 7), T[-1; 0; 9 // 10])
  ucon = vcat(T(Inf) * ones(T, 4), 250, T(Inf) * ones(T, 10))
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 2; 2; 3; 3; 4; 4; 4; 5; 5; 5],
    [3; 2; 2; 1; 7; 8; 11; 12; 13; 11; 12; 13],
    T[1; -1; 1; -1; -a; a; 1; 1; 1; 1; 1; 1],
    c!,
    lcon,
    ucon,
    name = "hs116";
    kwargs...,
  )
end
