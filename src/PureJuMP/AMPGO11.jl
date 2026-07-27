export AMPGO11

"Univariate multimodal minimization problem AMPGO11"
function AMPGO11(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -pi)

  @objective(nlp, Min, 2 * cos(x) + cos(2 * x))

  return nlp
end
