export colville6

function colville6(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  f1(t) = (t < 300) * 30 * t + (t >= 300) * 31 * t
  f2(t) = (t < 100) * 28 * t + (100 <= t) * (t < 200) * 29 * t + (t >= 200) * 30 * t
  f(x) = f1(x[1]) + f2(x[2])

  x0 = T[390, 1000, 419.5, 340.5, 198.175, 0.5]
  lvar = T[0, 0, 340, 340, -1000, 0]
  uvar = T[400, 1000, 420, 420, 10000, 0.5236]

  a = T(131078 // 1000)
  b = T(148477 // 100000)
  c = T(90798 // 100000)
  d = cos(T(147588 // 100000))
  e = sin(T(147588 // 100000))

  function c!(cx, x)
    cx[1] = 300 - x[1] - x[3] * x[4] * cos(b - x[6]) / a + c * d * x[3]^2 / a
    cx[2] = -x[2] - x[3] * x[4] * cos(b + x[6]) / a + c * d * x[4]^2 / a
    cx[3] = -x[5] - x[3] * x[4] * sin(b + x[6]) / a + c * e * x[4]^2 / a
    cx[4] = 200 - x[3] * x[4] * sin(b - x[6]) / a + c * e * x[3]^2 / a
    return cx
  end
  lcon = zeros(T, 4)
  ucon = zeros(T, 4)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "colville6"; kwargs...)
end
