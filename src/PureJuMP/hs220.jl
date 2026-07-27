export hs220

"HS220 model"
function hs220(args...; kwargs...)
  nlp = Model()
  x0 = [25000, 25000]
  lvar = [1, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, x[1])
  @constraint(nlp, (x[1] - 1)^3 - x[2] == 0)

  return nlp
end
