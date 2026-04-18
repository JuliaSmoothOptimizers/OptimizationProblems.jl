export hs5

"HS5 model"
function hs5(args...; kwargs...)
  nlp = Model()
  lvar = [-1.5, -3]
  uvar = [4, 3]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = 0)

  @objective(nlp, Min, sin(x[1] + x[2]) + (x[1] - x[2])^2 - 1.5 * x[1] + 2.5 * x[2] + 1)

  return nlp
end
