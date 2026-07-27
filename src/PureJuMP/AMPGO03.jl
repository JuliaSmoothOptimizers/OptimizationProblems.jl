export AMPGO03

"Univariate multimodal minimization problem AMPGO03"
function AMPGO03(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -10.0)

  @objective(
    nlp,
    Min,
    -(
      1 * sin(2 * x + 1) +
      2 * sin(3 * x + 2) +
      3 * sin(4 * x + 3) +
      4 * sin(5 * x + 4) +
      5 * sin(6 * x + 5) +
      6 * sin(7 * x + 6)
    )
  )

  return nlp
end
