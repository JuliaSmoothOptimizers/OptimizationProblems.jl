export hs27

"HS27 Model"
function hs27(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:3], start = 2)

  @objective(nlp, Min, 0.01 * (x[1] - 1)^2 + (x[2] - x[1]^2)^2)

  @constraint(nlp, constr1, x[1] + x[3]^2 + 1 == 0)

  return nlp
end
