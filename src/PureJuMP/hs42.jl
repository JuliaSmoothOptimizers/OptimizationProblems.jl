export hs42

"HS42 model"
function hs42(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:4], start = 1)

  @constraint(nlp, x[3]^2 + x[4]^2 - 2 == 0)

  @constraint(nlp, x[1] - 2 == 0)

  @objective(
    nlp,
    Min,
    0.5 * (x[1] - 1)^2 + 0.5 * (x[2] - 2)^2 + 0.5 * (x[3] - 3)^2 + 0.5 * (x[4] - 4)^2
  )

  return nlp
end
