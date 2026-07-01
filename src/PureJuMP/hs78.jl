export hs78

"HS78 model"
function hs78(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 1.5, 2, -1, -1]
  @variable(nlp, x[i = 1:5], start = x0[i])

  @constraint(nlp, sum(x[i]^2 for i = 1:5) - 10 == 0)
  @constraint(nlp, x[2] * x[3] - 5 * x[4] * x[5] == 0)
  @constraint(nlp, x[1]^3 + x[2]^3 + 1 == 0)

  @objective(nlp, Min, prod(x[i] for i = 1:5))

  return nlp
end
