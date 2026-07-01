export hs64

"HS64 model"
function hs64(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:3] ≥ 1e-5, start = 1)

  @constraint(nlp, -1 + 4 / x[1] + 32 / x[2] + 120 / x[3] ≤ 0)

  @objective(
    nlp,
    Min,
    5 * x[1] + 50000 / x[1] + 20 * x[2] + 72000 / x[2] + 10 * x[3] + 144000 / x[3]
  )

  return nlp
end
