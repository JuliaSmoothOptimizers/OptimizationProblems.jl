export hs229

"HS229 model"
function hs229(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2, 1]
  lvar = [-2, -2]
  uvar = [2, 2]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  return nlp
end
