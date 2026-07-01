export hs258

"HS258 model: Powell's function"
function hs258(args...; kwargs...)
  nlp = Model()
  x0 = [-3, -1, -3, -1]

  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(
    nlp,
    Min,
    100 * (x[2] - x[1]^2)^2 +
    (1 - x[1])^2 +
    90 * (x[3]^2 - x[4])^2 +
    (x[3] - 1)^2 +
    10.1 * (x[2] - 1)^2 +
    10.1 * (x[4] - 1)^2 +
    19.8 * (x[2] - 1) * (x[4] - 1)
  )

  return nlp
end
