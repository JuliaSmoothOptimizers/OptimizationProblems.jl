export hs85

function hs85(; type::Type{T} = Float64, kwargs...) where {T}
  a = T[
    0,
    17.505,
    11.275,
    214.228,
    7.458,
    0.961,
    1.612,
    0.146,
    107.99,
    922.693,
    926.832,
    18.766,
    1072.163,
    8961.448,
    0.063,
    71084.33,
    2802713,
  ]
  b = T[
    0,
    1053.6667,
    35.03,
    665.585,
    584.463,
    265.916,
    7.046,
    0.222,
    273.366,
    1286.105,
    1444.046,
    537.141,
    3247.039,
    26844.086,
    0.386,
    140000,
    12146108,
  ]
  c10 = T(12.3) / T(752.3)

  # Variable bounds and starting point (exact from the standard model)
  lvar = T[704.4148, 68.6, 0.0, 193.0, 25.0]
  uvar = T[906.3855, 288.88, 134.75, 287.0966, 84.1988]
  x0 = T[900.0, 80.0, 115.0, 267.0, 27.0]

  # Best known value ≈ -1.90513375
  function f(x)
    # All intermediates (identical to those used in constraints)
    y1 = x[2] + x[3] + T(41.6)
    c1 = T(0.024) * x[4] - T(4.62)
    y2 = T(12.5) / c1 + T(12)
    c2 = T(0.0003535) * x[1]^2 + T(0.5311) * x[1] + T(0.08705) * y2 * x[1]
    c3 = T(0.052) * x[1] + T(78) + T(0.002377) * y2 * x[1]
    y3 = c2 / c3
    y4 = T(19) * y3
    c4 =
      T(0.04782) * (x[1] - y3) + T(0.1956) * (x[1] - y3)^2 / x[2] + T(0.6376) * y4 + T(1.594) * y3
    c5 = T(100) * x[2]
    c6 = x[1] - y3 - y4
    c7 = T(0.95) - c4 / c5
    y5 = c6 * c7
    y6 = x[1] - y5 - y4 - y3
    c8 = (y5 + y4) * T(0.995)
    y7 = c8 / y1
    y8 = c8 / T(3798)
    c9 = y7 - T(0.0663) * y7 / y8 - T(0.3153)
    y9 = T(96.82) / c9 + T(0.321) * y1
    y10 = T(1.29) * y5 + T(1.258) * y4 + T(2.29) * y3 + T(1.71) * y6
    y11 = T(1.71) * x[1] - T(0.452) * y4 + T(0.58) * y3
    c11 = T(1.75) * y2 * T(0.995) * x[1]
    c12 = T(0.995) * y10 + T(1998)
    y12 = c10 * x[1] + c11 / c12
    y13 = c12 - T(1.75) * y2
    y14 = T(3623) + T(64.4) * x[2] + T(58.4) * x[3] + T(146312) / (y9 + x[5])
    c13 = T(0.995) * y10 + T(60.8) * x[2] + T(48) * x[4] - T(0.1121) * y14 - T(5095)
    y15 = y13 / c13
    y16 = T(148000) - T(331000) * y15 + T(40) * y13 - T(61) * y15 * y13
    c14 = T(2324) * y10 - T(28740000) * y2
    y17 = T(14130000) - T(1328) * y10 - T(531) * y11 + c14 / c12
    c15 = y13 / y15 - y13 / T(0.52)
    c16 = T(1.104) - T(0.72) * y15
    # c17 not needed for objective

    return -T(5.843e-7) * y17 +
           T(1.17e-4) * y14 +
           T(2.358e-5) * y13 +
           T(1.502e-6) * y16 +
           T(0.0321) * y12 +
           T(0.004324) * y5 +
           T(1e-4) * c15 / c16 +
           T(37.48) * y2 / c12 +
           T(0.1365)
  end

  # Constraint function (38 nonlinear inequalities, all of the form c(x) >= 0)
  function c!(cx, x)
    # All intermediates (identical to those used in objective)
    y1 = x[2] + x[3] + T(41.6)
    c1 = T(0.024) * x[4] - T(4.62)
    y2 = T(12.5) / c1 + T(12)
    c2 = T(0.0003535) * x[1]^2 + T(0.5311) * x[1] + T(0.08705) * y2 * x[1]
    c3 = T(0.052) * x[1] + T(78) + T(0.002377) * y2 * x[1]
    y3 = c2 / c3
    y4 = T(19) * y3
    c4 =
      T(0.04782) * (x[1] - y3) + T(0.1956) * (x[1] - y3)^2 / x[2] + T(0.6376) * y4 + T(1.594) * y3
    c5 = T(100) * x[2]
    c6 = x[1] - y3 - y4
    c7 = T(0.95) - c4 / c5
    y5 = c6 * c7
    y6 = x[1] - y5 - y4 - y3
    c8 = (y5 + y4) * T(0.995)
    y7 = c8 / y1
    y8 = c8 / T(3798)
    c9 = y7 - T(0.0663) * y7 / y8 - T(0.3153)
    y9 = T(96.82) / c9 + T(0.321) * y1
    y10 = T(1.29) * y5 + T(1.258) * y4 + T(2.29) * y3 + T(1.71) * y6
    y11 = T(1.71) * x[1] - T(0.452) * y4 + T(0.58) * y3
    c11 = T(1.75) * y2 * T(0.995) * x[1]
    c12 = T(0.995) * y10 + T(1998)
    y12 = c10 * x[1] + c11 / c12
    y13 = c12 - T(1.75) * y2
    y14 = T(3623) + T(64.4) * x[2] + T(58.4) * x[3] + T(146312) / (y9 + x[5])
    c13 = T(0.995) * y10 + T(60.8) * x[2] + T(48) * x[4] - T(0.1121) * y14 - T(5095)
    y15 = y13 / c13
    y16 = T(148000) - T(331000) * y15 + T(40) * y13 - T(61) * y15 * y13
    c14 = T(2324) * y10 - T(28740000) * y2
    y17 = T(14130000) - T(1328) * y10 - T(531) * y11 + c14 / c12
    c15 = y13 / y15 - y13 / T(0.52)
    c16 = T(1.104) - T(0.72) * y15
    c17 = y9 + x[5]
    # 35 nonlinear constraints: cx[1:18] of the form c(x) >= 0, cx[19:35] of the form c(x) <= 0.
    # The 3 remaining (linear) constraints of HS85 are passed separately below.
    cx[1] = y2 - a[2]
    cx[2] = y3 - a[3]
    cx[3] = y4 - a[4]
    cx[4] = y5 - a[5]
    cx[5] = y6 - a[6]
    cx[6] = y7 - a[7]
    cx[7] = y8 - a[8]
    cx[8] = y9 - a[9]
    cx[9] = y10 - a[10]
    cx[10] = y11 - a[11]
    cx[11] = y12 - a[12]
    cx[12] = y13 - a[13]
    cx[13] = y14 - a[14]
    cx[14] = y15 - a[15]
    cx[15] = y16 - a[16]
    cx[16] = y17 - a[17]
    cx[17] = y4 - (T(0.28) / T(0.72)) * y5
    cx[18] = T(62212) / c17 - T(110.6) - y1
    cx[19] = y2 - b[2]
    cx[20] = y3 - b[3]
    cx[21] = y4 - b[4]
    cx[22] = y5 - b[5]
    cx[23] = y6 - b[6]
    cx[24] = y7 - b[7]
    cx[25] = y8 - b[8]
    cx[26] = y9 - b[9]
    cx[27] = y10 - b[10]
    cx[28] = y11 - b[11]
    cx[29] = y12 - b[12]
    cx[30] = y13 - b[13]
    cx[31] = y14 - b[14]
    cx[32] = y15 - b[15]
    cx[33] = y16 - b[16]
    cx[34] = y17 - b[17]
    cx[35] = T(3496) * y2 / c12 - T(21)
    return cx
  end

  # 3 linear constraints, given as a sparse Jacobian (rows, cols, vals):
  # cx[1] = 1.5 x2 - x3 (>= 0), cx[2] = cx[3] = x2 + x3 (bounded below and above respectively)
  clinrows = [1, 1, 2, 2, 3, 3]
  clincols = [2, 3, 2, 3, 2, 3]
  clinvals = T[1.5, -1, 1, 1, 1, 1]

  # Constraint bounds: overall cx[1:3] are the linear constraints above,
  # cx[4:21] are of the form c(x) >= 0, cx[22:38] are of the form c(x) <= 0.
  m = 38
  cl = zeros(T, m)
  cu = fill(T(Inf), m)
  cl[2], cu[3] = T(171.5), T(363.63)
  cl[3] = T(-Inf)
  for i = 22:38
    cl[i], cu[i] = T(-Inf), zero(T)
  end
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    clinrows,
    clincols,
    clinvals,
    c!,
    cl,
    cu;
    name = "hs85",
    kwargs...,
  )
end
