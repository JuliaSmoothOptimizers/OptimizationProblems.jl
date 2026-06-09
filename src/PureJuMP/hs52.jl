export hs52

"HS52 model"
function hs52(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:5], start = 2)

  @constraint(nlp, x[1] + 3 * x[2] == 0)
  @constraint(nlp, x[3] + x[4] - 2 * x[5] == 0)
  @constraint(nlp, x[2] - x[5] == 0)

  @objective(
    nlp,
    Min,
    0.5 * (4 * x[1] - x[2])^2 + 0.5 * (x[2] + x[3] - 2)^2 + 0.5 * (x[4] - 1)^2 + 0.5 * (x[5] - 1)^2
  )

  return nlp
end
