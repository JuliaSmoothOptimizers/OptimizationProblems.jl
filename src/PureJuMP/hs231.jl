export hs231

"HS231 model"
function hs231(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2, 1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)
  @constraint(nlp, 1 / 3 * x[1] + x[2] + 0.1 >= 0)
  @constraint(nlp, -1 / 3 * x[1] + x[2] + 0.1 >= 0)

  return nlp
end
