export hs61

"HS61 model"
function hs61(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:3], start = 0)

  @NLconstraint(nlp, 3 * x[1] - 2 * x[2]^2 - 7 == 0)
  @NLconstraint(nlp, 4 * x[1] - x[3]^2 - 11 == 0)

  @objective(nlp, Min, 4 * x[1]^2 + 2 * x[2]^2 + 2 * x[3]^2 - 33 * x[1] + 16 * x[2] - 24 * x[3])

  return nlp
end
