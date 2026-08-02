export dembo_gp2

function dembo_gp2(; n::Int = default_nvar, kwargs...)
  c = [
    5.35785470,
    0.83568910,
    37.239239,
    -40792.1410,
    0.00002584,
    -0.00006663,
    -0.00000734,
    0.000853007,
    0.00009395,
    -0.00033085,
    1330.32937,
    -0.42002610,
    -0.30585975,
    0.00024186,
    0.00010159,
    0.00007379,
    2275.132693,
    -0.26680980,
    -0.40583930,
    0.00029955,
    0.00007992,
    0.00012157,
  ]

  model = Model()
  @variable(model, x[1:5])

  lbs = [78.0, 33.0, 27.0, 27.0, 27.0]
  ubs = [102.0, 45.0, 45.0, 45.0, 45.0]
  x0 = [78.62, 33.44, 31.07, 44.18, 35.22]
  for i in 1:5
    set_lower_bound(x[i], lbs[i])
    set_upper_bound(x[i], ubs[i])
    set_start_value(x[i], x0[i])
  end

  @objective(model, Min, c[1] * x[2] + c[2] * x[1] * x[5] + c[3] * x[1] + c[4])

  @constraint(model, c[5] * x[3] * x[5] + c[6] * x[2] * x[5] + c[7] * x[1] * x[4] <= 0)
  @constraint(model, c[8] * x[2] * x[5] + c[9] * x[1] * x[4] + c[10] * x[3] * x[5] <= 0)
  @constraint(model, c[11] / (x[2] * x[5]) + c[12] * x[1] / x[5] + c[13] / x[5] <= 0)
  @constraint(model, c[14] * x[2] * x[5] + c[15] * x[1] * x[2] + c[16] * x[2] <= 0)
  @constraint(model, c[17] / (x[3] * x[5]) + c[18] * x[1] / x[5] + c[19] * x[4] / x[5] <= 0)
  @constraint(model, c[20] * x[3] * x[5] + c[21] * x[1] * x[3] + c[22] * x[3] * x[4] <= 0)

  return model
end
