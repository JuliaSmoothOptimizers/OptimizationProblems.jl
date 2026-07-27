export AMPGO07

"Univariate multimodal minimization problem AMPGO07"
function AMPGO07(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 2.7)

  @objective(
    nlp,
    Min,
    ifelse(x <= 0.0, Inf, sin(x) + sin((10.0 / 3.0) * x) + log(abs(x)) - 0.84 * x + 3)
  )

  return nlp
end
