export hs259

"HS259 model"
function hs259(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0, 0, 0]

  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(
    nlp,
    Min,
    100 * (x[2] - x[1]^2)^2 +
    (1 - x[1])^2 +
    90 * (x[3]^2 - x[4])^2 +
    (1 - x[3])^3 +
    10.1 * (x[2] - 1)^2 +
    (x[4] - 1)^2 +
    19.8 * (x[2] - 1) * (x[4] - 1)
  )

  return nlp
end
