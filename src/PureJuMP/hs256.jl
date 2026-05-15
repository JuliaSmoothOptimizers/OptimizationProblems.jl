export hs256

"HS256 model: Powell's function"
function hs256(args...; kwargs...)
  nlp = Model()
  x0 = [3, -1, 0, 1]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(
    nlp,
    Min,
    (x[1] + 10 * x[2])^2 + 5 * (x[3] - x[4])^2 + (x[2] - 2 * x[3])^4 + 10 * (x[1] - x[4])^4
  )

  return nlp
end
