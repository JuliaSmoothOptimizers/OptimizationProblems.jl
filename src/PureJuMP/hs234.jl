export hs234

"HS234 model"
function hs234(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0]
  lvar = [0.2, 0.2]
  uvar = [2, 2]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, (x[2] - x[1])^4 - (1 - x[1]))
  @constraint(nlp, -x[1]^2 - x[2]^2 + 1 >= 0)

  return nlp
end
