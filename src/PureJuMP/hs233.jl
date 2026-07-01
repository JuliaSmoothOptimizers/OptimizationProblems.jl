export hs233

"HS233 model"
function hs233(args...; kwargs...)
  nlp = Model()
  x0 = [1.2, 1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)
  @constraint(nlp, x[1]^2 + x[2]^2 - 0.25 >= 0)
  return nlp
end
