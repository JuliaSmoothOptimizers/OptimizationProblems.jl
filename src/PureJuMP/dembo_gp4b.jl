export dembo_gp4b

function dembo_gp4b(; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, 0.1 <= x[1:8] <= 10.0)
  set_start_value.(x, [6.0, 3.0, 0.4, 0.2, 6.0, 6.0, 1.0, 0.5])

  @objective(model, Min, 0.4 * x[1]^0.67 * x[7]^0.67 + 0.4 * x[2]^0.67 * x[8]^0.67 + 10.0 - x[1] - x[2])

  @constraint(model, 0.0588 * x[5] * x[7] + 0.1 * x[1] <= 0)
  @constraint(model, 0.0588 * x[6] * x[8] + 0.1 * x[1] + 0.1 * x[2] <= 0)
  @constraint(model, 4.0 * x[3] / x[5] + 2.0 * x[3]^0.71 / x[5] + 0.0588 * x[3]^1.3 * x[7] <= 0)
  @constraint(model, 4.0 * x[4] / x[6] + 2.0 * x[4]^0.71 / x[6] + 0.0588 * x[4]^1.3 * x[8] <= 0)

  return model
end
