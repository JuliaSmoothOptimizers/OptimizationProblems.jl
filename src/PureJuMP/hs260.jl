export hs260

"HS260 model"
function hs260(args...; kwargs...)
  nlp = Model()
  x0 = [-3, -1, -3, -1]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(
    nlp,
    Min,
    100 * (x[2] - x[1]^2)^2 +
    (1 - x[1])^2 +
    90 * (x[4] - x[3]^2)^2 +
    (1 - x[3])^2 +
    9.9 * ((x[2] - 1) + (x[4] - 1))^2 +
    0.2 * ((x[2] - 1)^2 + (x[4] - 1)^2)
  )

  return nlp
end
