export dembo_gp6

function dembo_gp6(; n::Int = default_nvar, kwargs...)
  c = [
    1.0,
    1.0,
    1.0,
    1.262626,
    -1.231059,
    1.262626,
    -1.231059,
    1.262626,
    -1.231059,
    0.034750,
    0.975000,
    -0.009750,
    0.034750,
    0.975000,
    -0.009750,
    1.0,
    1.0,
    -1.0,
    0.002,
    0.002,
    1.0,
    1.0,
    -0.002,
    -0.002,
    1.0,
    1.0,
    500.0,
    -1.0,
    -500.0,
    0.9,
    0.002,
    -0.002,
    1.0,
    1.0,
    0.002,
    -0.002,
    0.034750,
    0.975000,
    -0.009750,
  ]

  model = Model()
  @variable(model, x[1:13])

  lbs = [0.1, 0.1, 0.9, 0.0001, 0.1, 0.1, 0.1, 0.1, 500.0, 0.1, 1.0, 0.0001, 0.0001]
  ubs = [1.0, 1.0, 1.0, 0.1, 0.9, 0.9, 1000.0, 1000.0, 1000.0, 500.0, 150.0, 150.0, 150.0]
  x0 = [0.50, 0.80, 0.90, 0.10, 0.14, 0.50, 489.0, 80.0, 650.0, 450.0, 150.0, 150.0, 150.0]
  for i in 1:13
    set_lower_bound(x[i], lbs[i])
    set_upper_bound(x[i], ubs[i])
    set_start_value(x[i], x0[i])
  end

  @objective(model, Min, c[1] * x[11] + c[2] * x[12] + c[3] * x[13])

  @constraint(model, c[4] * x[8] / x[11] + c[5] * x[1] * x[8] / x[11] <= 0)
  @constraint(model, c[6] * x[9] / x[12] + c[7] * x[2] * x[9] / x[12] <= 0)
  @constraint(model, c[8] * x[10] / x[13] + c[9] * x[3] * x[10] / x[13] <= 0)
  @constraint(model, c[10] * x[2] / x[5] + c[11] * x[2] + c[12] * x[1] / x[5] <= 0)
  @constraint(model, c[13] * x[3] / x[6] + c[14] * x[3] + c[15] * x[2] / x[6] <= 0)
  @constraint(model, c[16] * x[1] * x[8] / (x[5] * x[7]) + c[17] * x[4] / x[5] + c[18] * x[4] * x[8] / (x[5] * x[7]) <= 0)
  @constraint(model, c[19] * x[2] * x[9] + c[20] * x[5] * x[8] + c[21] * x[6] + c[22] * x[5] + c[23] * x[1] * x[8] + c[24] * x[6] * x[9] <= 0)
  @constraint(model, c[25] * x[3] * x[10] / (x[2] * x[9]) + c[26] * x[6] / x[2] + c[27] / x[9] + c[28] * x[10] / x[9] + c[29] * x[6] / (x[2] * x[9]) <= 0)
  @constraint(model, c[30] / x[2] + c[31] * x[10] + c[32] * x[3] * x[10] / x[2] <= 0)
  @constraint(model, c[33] * x[2] / x[3] <= 0)
  @constraint(model, c[34] * x[1] / x[2] <= 0)
  @constraint(model, c[35] * x[7] + c[36] * x[8] <= 0)
  @constraint(model, c[37] * x[1] / x[4] + c[38] * x[1] + c[39] * x[3] / x[4] <= 0)

  return model
end
