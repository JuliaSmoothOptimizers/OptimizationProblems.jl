export hs71

"HS71 model"
function hs71(args...; kwargs...)
  nlp = Model()
  x0 = [1, 5, 5, 1]
  @variable(nlp, 1 ≤ x[i = 1:4] ≤ 5, start = x0[i])

  @constraint(nlp, x[1] * x[2] * x[3] * x[4] - 25 ≥ 0)
  @constraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40 == 0)

  @objective(nlp, Min, x[1] * x[4] * (x[1] + x[2] + x[3]) + x[3])

  return nlp
end
