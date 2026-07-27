export hs221

"HS221 model"
function hs221(args...; kwargs...)
  nlp = Model()
  x0 = [0.25, 0.25]
  lvar = [0, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -x[1])
  @constraint(nlp, (1 - x[1])^3 - x[2] >= 0)

  return nlp
end
