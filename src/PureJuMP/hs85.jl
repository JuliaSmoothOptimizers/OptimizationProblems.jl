## Hock and Schittkowski problem number 85
#
#   Source:
#   Problem 85 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QGR-P1-(1,...,6)
#
#   Implementation: AI/JSO, 03/2026

export hs85

"HS85 model"
function hs85_jump()
  m = Model(Ipopt.Optimizer)
  set_attribute(m, "tol", 1e-10)
  set_attribute(m, "print_level", 5)

  # Decision variables
  @variable(m, 704.4148 ≤ x1 ≤ 906.3855)
  @variable(m, 68.6 ≤ x2 ≤ 288.88)
  @variable(m, 0.0 ≤ x3 ≤ 134.75)
  @variable(m, 193.0 ≤ x4 ≤ 287.0966)
  @variable(m, 25.0 ≤ x5 ≤ 84.1988)

  # Intermediates (as @expression or @variable + @NLconstraint)
  @expression(m, y1, x2 + x3 + 41.6)
  @expression(m, c1, 0.024 * x4 - 4.62)
  @expression(m, y2, 12.5 / c1 + 12)
  @expression(m, c2, 0.0003535 * x1^2 + 0.5311 * x1 + 0.08705 * y2 * x1)
  @expression(m, c3, 0.052 * x1 + 78 + 0.002377 * y2 * x1)
  @expression(m, y3, c2 / c3)
  @expression(m, y4, 19 * y3)
  @expression(m, c4, 0.04782 * (x1 - y3) + 0.1956 * (x1 - y3)^2 / x2 + 0.6376 * y4 + 1.594 * y3)
  @expression(m, c5, 100 * x2)
  @expression(m, c6, x1 - y3 - y4)
  @expression(m, c7, 0.95 - c4 / c5)
  @expression(m, y5, c6 * c7)
  @expression(m, y6, x1 - y5 - y4 - y3)
  @expression(m, c8, (y5 + y4) * 0.995)
  @expression(m, y7, c8 / y1)
  @expression(m, y8, c8 / 3798)
  @expression(m, c9, y7 - 0.0663 * y7 / y8 - 0.3153)
  @expression(m, y9, 96.82 / c9 + 0.321 * y1)
  @expression(m, y10, 1.29 * y5 + 1.258 * y4 + 2.29 * y3 + 1.71 * y6)
  @expression(m, y11, 1.71 * x1 - 0.452 * y4 + 0.58 * y3)
  @expression(m, c11, 1.75 * y2 * 0.995 * x1)
  @expression(m, c12, 0.995 * y10 + 1998)
  @expression(m, y12, (12.3/752.3) * x1 + c11 / c12)
  @expression(m, y13, c12 - 1.75 * y2)
  @expression(m, y14, 3623 + 64.4 * x2 + 58.4 * x3 + 146312 / (y9 + x5))
  @expression(m, c13, 0.995 * y10 + 60.8 * x2 + 48 * x4 - 0.1121 * y14 - 5095)
  @expression(m, y15, y13 / c13)
  @expression(m, y16, 148000 - 331000 * y15 + 40 * y13 - 61 * y15 * y13)
  @expression(m, c14, 2324 * y10 - 28740000 * y2)
  @expression(m, y17, 14130000 - 1328 * y10 - 531 * y11 + c14 / c12)
  @expression(m, c15, y13 / y15 - y13 / 0.52)
  @expression(m, c16, 1.104 - 0.72 * y15)
  @expression(m, c17, y9 + x5)

  # Bounds on y_i
  a = [
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

  b = [
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

  for i = 2:17
    yi = Symbol("y$i")
    @constraint(m, getfield(Main, yi) >= a[i])
    @constraint(m, getfield(Main, yi) <= b[i])
  end

  # Other inequalities
  @constraint(m, 1.5 * x2 - x3 >= 0)
  @constraint(m, y1 >= 213.1)
  @constraint(m, y1 <= 405.23)
  @constraint(m, y4 >= (0.28 / 0.72) * y5)
  @constraint(m, 3496 * y2 / c12 <= 21)
  @constraint(m, 62212 / c17 - 110.6 >= y1)

  # Objective
  @NLobjective(
    m,
    Min,
    -5.843e-7 * y17 +
    1.17e-4 * y14 +
    2.358e-5 * y13 +
    1.502e-6 * y16 +
    0.0321 * y12 +
    0.004324 * y5 +
    1e-4 * (c15 / c16) +
    37.48 * y2 / c12 +
    0.1365
  )

  # Good starting point helps a lot
  set_start_value(x1, 900.0)
  set_start_value(x2, 80.0)
  set_start_value(x3, 115.0)
  set_start_value(x4, 267.0)
  set_start_value(x5, 27.0)

  return m
end
