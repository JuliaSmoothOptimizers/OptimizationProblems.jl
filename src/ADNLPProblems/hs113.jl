export hs113

function hs113(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]^2 + x[1] * x[2] - 14 * x[1] - 16 * x[2] +
           (x[3] - 10)^2 +
           4 * (x[4] - 5)^2 +
           (x[5] - 3)^2 +
           2 * (x[6] - 1)^2 +
           5 * x[7]^2 +
           7 * (x[8] - 11)^2 +
           2 * (x[9] - 10)^2 +
           (x[10] - 7)^2 +
           45
  end
  x0 = T[2, 3, 5, 5, 1, 2, 7, 3, 6, 10]
  function c!(cx, x)
    cx[1] = -3 * (x[1] - 2)^2 - 4 * (x[2] - 3)^2 - 2 * x[3]^2 + 7 * x[4] + 120
    cx[2] = -5 * x[1]^2 - 8 * x[2] - (x[3] - 6)^2 + 2 * x[4] + 40
    cx[3] = -0.5 * (x[1] - 8)^2 - 2 * (x[2] - 4)^2 - 3 * x[5]^2 + x[6] + 30
    cx[4] = -x[1]^2 - 2 * (x[2] - 2)^2 + 2 * x[1] * x[2] - 14 * x[5] + 6 * x[6]
    cx[5] = 3 * x[1] - 6 * x[2] - 12 * (x[9] - 8)^2 + 7 * x[10]
    return cx
  end
  lcon = vcat(-105, 0, -12, zeros(T, 5))
  ucon = T(Inf) * ones(T, 8)
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    [1; 1; 1; 1; 2; 2; 2; 2; 3; 3; 3; 3],
    [1; 2; 7; 8; 1; 2; 7; 8; 1; 2; 9; 10],
    T[-4; -5; 3; -9; -10; 8; 17; -2; 8; -2; -5; 2],
    c!,
    lcon,
    ucon,
    name = "hs113";
    kwargs...,
  )
end
