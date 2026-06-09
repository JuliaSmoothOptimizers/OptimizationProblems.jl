export hs72

"HS72 model"
function hs72(args...; kwargs...)
  nlp = Model()
  uvar = [(5 - i) * 1e5 for i = 1:4]
  @variable(nlp, 0.001 ≤ x[i = 1:4] ≤ uvar[i], start = 1)

  @constraint(nlp, -0.0401 + 4 / x[1] + 2.25 / x[2] + 1 / x[3] + 0.25 / x[4] ≤ 0)
  @constraint(nlp, -0.010085 + 0.16 / x[1] + 0.36 / x[2] + 0.64 / x[3] + 0.64 / x[4] ≤ 0)

  @objective(nlp, Min, 1 + x[1] + x[2] + x[3] + x[4])

  return nlp
end
