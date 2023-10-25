export hs99

function hs99(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  b = 32
  a = [0, 50, 50, 75, 75, 75, 100, 100]
  t = [0, 25, 50, 100, 150, 200, 290, 380]

  r1(x) = 0
  r2(x) = a[2] * (t[2] - t[1]) * cos(x[1]) + r1(x)
  r3(x) = a[3] * (t[3] - t[2]) * cos(x[2]) + r2(x)
  r4(x) = a[4] * (t[4] - t[3]) * cos(x[3]) + r3(x)
  r5(x) = a[5] * (t[5] - t[4]) * cos(x[4]) + r4(x)
  r6(x) = a[6] * (t[6] - t[5]) * cos(x[5]) + r5(x)
  r7(x) = a[7] * (t[7] - t[6]) * cos(x[6]) + r6(x)
  r8(x) = a[8] * (t[8] - t[7]) * cos(x[7]) + r7(x)

  function f(x)
    return -r8(x)^2
  end
  x0 = 1 // 2 * ones(T, 7)
  lvar = zeros(T, 7)
  uvar = 158 // 100 * ones(T, 7)

  q1(x) = 0
  s1(x) = 0
  q2(x) = 1 // 2 * (t[2] - t[1])^2 * (a[2] * sin(x[1]) - b) + (t[2] - t[1]) * s1(x) + q1(x)
  s2(x) = (t[2] - t[1]) * (a[2] * sin(x[1]) - b) + s1(x)
  q3(x) = 1 // 2 * (t[3] - t[2])^2 * (a[3] * sin(x[2]) - b) + (t[3] - t[2]) * s2(x) + q2(x)
  s3(x) = (t[3] - t[2]) * (a[3] * sin(x[2]) - b) + s2(x)
  q4(x) = 1 // 2 * (t[4] - t[3])^2 * (a[4] * sin(x[3]) - b) + (t[4] - t[3]) * s3(x) + q3(x)
  s4(x) = (t[4] - t[3]) * (a[4] * sin(x[3]) - b) + s3(x)
  q5(x) = 1 // 2 * (t[5] - t[4])^2 * (a[5] * sin(x[4]) - b) + (t[5] - t[4]) * s4(x) + q4(x)
  s5(x) = (t[5] - t[4]) * (a[5] * sin(x[4]) - b) + s4(x)
  q6(x) = 1 // 2 * (t[6] - t[5])^2 * (a[6] * sin(x[5]) - b) + (t[6] - t[5]) * s5(x) + q5(x)
  s6(x) = (t[6] - t[5]) * (a[6] * sin(x[5]) - b) + s5(x)
  q7(x) = 1 // 2 * (t[7] - t[6])^2 * (a[7] * sin(x[6]) - b) + (t[7] - t[6]) * s6(x) + q6(x)
  s7(x) = (t[7] - t[6]) * (a[7] * sin(x[6]) - b) + s6(x)
  q8(x) = 1 // 2 * (t[8] - t[7])^2 * (a[8] * sin(x[7]) - b) + (t[8] - t[7]) * s7(x) + q7(x)
  s8(x) = (t[8] - t[7]) * (a[8] * sin(x[7]) - b) + s7(x)

  function c!(cx, x)
    cx[1] = q8(x) - 100000
    cx[2] = s8(x) - 1000
    return cx
  end
  lcon = zeros(T, 2)
  ucon = zeros(T, 2)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs99"; kwargs...)
end
