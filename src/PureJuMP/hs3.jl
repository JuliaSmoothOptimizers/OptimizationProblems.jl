export hs3

"HS3 model"
function hs3(args...; kwargs...)
  nlp = Model()
  x0 = [10, 1]
  lvar = [-Inf, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, x[2] + 0.00001 * (x[2] - x[1])^2)

  return nlp
end
