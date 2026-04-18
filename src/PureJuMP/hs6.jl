export hs6

"HS6 model"
function hs6(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2, 1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, 0.5 * (x[1] - 1)^2)

  @constraint(nlp, 10 * (x[2] - x[1]^2) == 0)

  return nlp
end
