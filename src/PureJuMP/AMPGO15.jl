export AMPGO15

"Univariate multimodal minimization problem AMPGO15"
function AMPGO15(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -5.0)

  @objective(nlp, Min, (x^2 - 5 * x + 6) / (x^2 + 1))

  return nlp
end
