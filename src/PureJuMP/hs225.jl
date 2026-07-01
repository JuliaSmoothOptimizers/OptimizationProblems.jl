export hs225

"HS225 model"
function hs225(args...; kwargs...)
  nlp = Model()
  x0 = [3, 1]

  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[1]^2 + x[2]^2)
  @constraint(nlp, x[1] + x[2] - 1 >= 0)
  @constraint(nlp, x[1]^2 + x[2]^2 - 1 >= 0)
  @constraint(nlp, 9 * x[1]^2 + x[2]^2 - 9 >= 0)
  @constraint(nlp, x[1]^2 - x[2] >= 0)
  @constraint(nlp, x[2]^2 - x[1] >= 0)

  return nlp
end
