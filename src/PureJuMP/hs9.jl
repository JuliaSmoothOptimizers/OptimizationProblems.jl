export hs9

"HS9 Model"
function hs9(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 0)

  @objective(nlp, Min, sin(π * x[1] / 12) * cos(π * x[2] / 16))

  @constraint(nlp, constr1, 4 * x[1] - 3 * x[2] == 0)

  return nlp
end
