export hs25

"HS25 model"
function hs25(args...; kwargs...)
  nlp = Model()
  x0 = [100, 12.5, 3]
  lvar = [0.1, 0, 0]
  uvar = [100, 25.6, 5]
  @variable(nlp, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = x0[i])

  @expression(nlp, u[i = 1:99], 25 + (-50 * log(0.01 * i))^(2 / 3))
  @expression(nlp, f[i = 1:99], -0.01 * i + exp(-1 / x[1] * (u[i] - x[2])^x[3]))

  @objective(nlp, Min, sum(f[i]^2 for i = 1:99))

  return nlp
end
