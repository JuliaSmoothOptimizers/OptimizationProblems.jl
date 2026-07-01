export hs28

"HS28 model"
function hs28(args...; kwargs...)
  nlp = Model()
  x0 = [-4, 1, 1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @constraint(nlp, x[1] + 2 * x[2] + 3 * x[3] - 1 == 0)

  @objective(nlp, Min, 0.5 * (x[1] + x[2])^2 + 0.5 * (x[2] + x[3])^2)

  return nlp
end
