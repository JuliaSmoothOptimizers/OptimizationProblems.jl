export hs10

"HS10 model"
function hs10(args...; kwargs...)
  nlp = Model()
  x0 = [-10, 10]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[1] - x[2])

  @constraint(nlp, -3 * x[1]^2 + 2 * x[1] * x[2] - x[2]^2 + 1 ≥ 0)

  return nlp
end
