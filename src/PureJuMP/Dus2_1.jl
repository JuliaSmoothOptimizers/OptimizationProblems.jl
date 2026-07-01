export Dus2_1

"Univariate unimodal minimization problem Dus2_1"
function Dus2_1(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -1.0)

  @objective(nlp, Min, exp(x * (x - 1)))

  return nlp
end
