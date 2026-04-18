export zangwil3

"Zangwil3 Model"
function zangwil3(args...; kwargs...)
  nlp = Model()

  x0 = [100.0, -1.0, 2.5]

  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, 0)

  @constraint(nlp, constr1, x[1] - x[2] + x[3] == 0)

  @constraint(nlp, constr2, -x[1] + x[2] + x[3] == 0)

  @constraint(nlp, constr3, x[1] + x[2] - x[3] == 0)
  return nlp
end
