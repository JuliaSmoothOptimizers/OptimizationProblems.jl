export hs2

"HS2 model"
function hs2(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 1]
  lvar = [-Inf, 1.5]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  return nlp
end
