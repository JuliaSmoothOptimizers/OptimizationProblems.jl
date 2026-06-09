export Duscube

"Univariate multimodal minimization problem Duscube"
function Duscube(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 1.0)

  @objective(nlp, Min, x^3 - (x - 4)^2 - 100 * x)

  return nlp
end
