export hs4

"HS4 model"
function hs4(args...; kwargs...)
  nlp = Model()
  x0 = [1.125, 0.125]
  lvar = [1, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, (x[1] + 1)^3 / 3 + x[2])

  return nlp
end
