export hs41

"HS41 model"
function hs41(args...; kwargs...)
  nlp = Model()
  uvar = [1, 1, 1, 2]
  @variable(nlp, 0 ≤ x[i = 1:4] ≤ uvar[i], start = 2)

  @constraint(nlp, x[1] + 2 * x[2] + 2 * x[3] - x[4] == 0)

  @objective(nlp, Min, 2 - x[1] * x[2] * x[3])

  return nlp
end
