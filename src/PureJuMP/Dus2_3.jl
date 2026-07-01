export Dus2_3

"Univariate unimodal minimization problem Dus2_3"
function Dus2_3(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -2.0)

  @objective(nlp, Min, 1 - (1 / (5 * (x^2) - 6 * x + 5)))

  return nlp
end
