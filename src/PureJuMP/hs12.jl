export hs12

"HS12 model"
function hs12(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 0)

  @objective(nlp, Min, x[1]^2 / 2 + x[2]^2 - x[1] * x[2] - 7 * x[1] - 7 * x[2])

  @constraint(nlp, 4 * x[1]^2 + x[2]^2 ≤ 25)

  return nlp
end
