export bt1

"BT1 Model"
function bt1(args...; kwargs...)
  nlp = Model()

  x0 = [0.08, 0.06]

  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, 100 * x[1]^2 + 100 * x[2]^2 - x[1] - 100)

  @constraint(nlp, constr1, x[1]^2 + x[2]^2 - 1.0 == 0)

  return nlp
end
