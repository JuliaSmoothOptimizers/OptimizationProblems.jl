export beale

"Beale Model"
function beale(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:2], start = 1.0)

  @objective(
    nlp,
    Min,
    0.5 * (1.5 - x[1] * (1.0 - x[2]))^2 +
    0.5 * (2.25 - x[1] * (1.0 - x[2]^2))^2 +
    0.5 * (2.625 - x[1] * (1.0 - x[2]^3))^2,
  )

  return nlp
end
