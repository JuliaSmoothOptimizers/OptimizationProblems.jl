export hs36

"HS36 model"
function hs36(args...; kwargs...)
  nlp = Model()
  uvar = [20, 11, 42]
  @variable(nlp, 0 ≤ x[i = 1:3] ≤ uvar[i], start = 10)

  @constraint(nlp, -72 + x[1] + 2 * x[2] + 2 * x[3] ≤ 0)

  @objective(nlp, Min, -x[1] * x[2] * x[3])

  return nlp
end
