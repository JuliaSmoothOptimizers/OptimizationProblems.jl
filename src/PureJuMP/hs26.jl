export hs26

"HS26 Model"
function hs26(args...; kwargs...)
  nlp = Model()
  x0 = [-2.6, 2.0, 2.0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, (x[1] - x[2])^2 + (x[2] - x[3])^4)

  @constraint(nlp, constr1, (1 + x[2]^2) * x[1] + x[3]^4 - 3 == 0)

  return nlp
end
