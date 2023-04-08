export hs109

function hs109(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 3 * x[1] + 1 // 1000000 * x[1]^3 + 2 * x[2] + eltype(x)(0.522074e-6) * x[2]^3
  end
  x0 = zeros(T, 9)
  lvar = T[0, 0, -0.55, -0.55, 196, 196, 196, -400, -400]
  uvar = T[Inf, Inf, 0.55, 0.55, 252, 252, 252, 800, 800]
  function c!(cx, x)
    a = 50176 // 1000
    b = sin(eltype(x)(25 // 100))
    ci = cos(eltype(x)(25 // 100))
    cx[1] = 2250000 - x[1]^2 - x[8]^2
    cx[2] = 2250000 - x[2]^2 - x[9]^2
    cx[3] =
      x[5] * x[6] * sin(-x[3] - 1 / 4) + x[5] * x[7] * sin(-x[4] - 1 / 4) + 2 * b * x[5]^2 -
      a * x[1] + 400 * a
    cx[4] =
      x[5] * x[6] * sin(x[3] - 1 / 4) + x[6] * x[7] * sin(x[3] - x[4] - 1 / 4) + 2 * b * x[6]^2 -
      a * x[2] + 400 * a
    cx[5] =
      x[5] * x[7] * sin(x[4] - 1 / 4) +
      x[6] * x[7] * sin(x[4] - x[3] - 1 / 4) +
      2 * b * x[7]^2 +
      881.779 * a
    cx[6] =
      a * x[8] + x[5] * x[6] * cos(-x[3] - 1 / 4) + x[5] * x[7] * cos(-x[4] - 1 / 4) - 200 * a -
      2 * ci * x[5]^2 + 0.7533e-3 * a * x[5]^2
    cx[7] =
      a * x[9] + x[5] * x[6] * cos(x[3] - 1 / 4) + x[6] * x[7] * cos(x[3] - x[4] - 1 / 4) -
      200 * a - 2 * ci * x[6]^2 + 0.7533e-3 * a * x[6]^2
    cx[8] =
      x[5] * x[7] * cos(x[4] - 1 / 4) + x[6] * x[7] * cos(x[4] - x[3] - 1 / 4) + 22.938 * a -
      2 * ci * x[7]^2 + 0.7533e-3 * a * x[7]^2
    return cx
  end
  lcon = vcat(-T(0.55), zeros(T, 8))
  ucon = vcat(T(0.55), T(Inf), T(Inf), zeros(T, 6))
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    [1; 1],
    [4; 3],
    T[1; -1],
    c!,
    lcon,
    ucon,
    name = "hs109";
    kwargs...,
  )
end
