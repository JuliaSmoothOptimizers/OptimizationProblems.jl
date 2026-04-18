export hs249

"HS249 model"
function hs249(args...; kwargs...)
  nlp = Model()
  x0 = [1, 1, 1]
  lvar = [1, -Inf, -Inf]
  @variable(nlp, x[i = 1:3] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, x[1]^2 + x[2]^2 + x[3]^2)
  @constraint(nlp, x[1]^2 + x[2]^2 - 1 >= 0)

  return nlp
end
