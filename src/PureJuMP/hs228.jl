export hs228

"HS228 model"
function hs228(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[1]^2 + x[2])
  @constraint(nlp, -x[1] - x[2] + 1 >= 0)
  @constraint(nlp, -(x[1]^2 + x[2]^2) + 9 >= 0)

  return nlp
end
