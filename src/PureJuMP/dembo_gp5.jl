export dembo_gp5

function dembo_gp5(; n::Int = default_nvar, kwargs...)
  c = [
    1.0,
    1.0,
    1.0,
    833.33252,
    100.0,
    -83333.333,
    1250.0,
    1.0,
    -1250.0,
    1250000.0,
    1.0,
    -2500.0,
    0.0025,
    0.0025,
    0.0025,
    0.0025,
    -0.0025,
    0.01,
    -0.01,
  ]

  model = Model()
  @variable(model, x[1:8])

  lbs = [100.0, 1000.0, 1000.0, 10.0, 10.0, 10.0, 10.0, 10.0]
  ubs = [10000.0, 10000.0, 10000.0, 1000.0, 1000.0, 1000.0, 1000.0, 1000.0]
  x0 = [5000.0, 5000.0, 5000.0, 200.0, 350.0, 150.0, 225.0, 425.0]
  for i in 1:8
    set_lower_bound(x[i], lbs[i])
    set_upper_bound(x[i], ubs[i])
    set_start_value(x[i], x0[i])
  end

  @objective(model, Min, c[1] * x[1] + c[2] * x[2] + c[3] * x[3])

  @constraint(model, c[4] * x[4] / (x[1] * x[6]) + c[5] / x[6] + c[6] / (x[1] * x[6]) <= 0)
  @constraint(model, c[7] * x[5] / (x[2] * x[7]) + c[8] * x[4] / x[7] + c[9] * x[4] / (x[2] * x[7]) <= 0)
  @constraint(model, c[10] / (x[3] * x[8]) + c[11] * x[5] / x[8] + c[12] * x[5] / (x[3] * x[8]) <= 0)
  @constraint(model, c[13] * x[4] + c[14] * x[6] <= 0)
  @constraint(model, c[15] * x[5] + c[16] * x[7] + c[17] * x[4] <= 0)
  @constraint(model, c[18] * x[8] + c[19] * x[5] <= 0)

  return model
end
