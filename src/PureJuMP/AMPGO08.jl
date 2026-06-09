export AMPGO08

"Univariate multimodal minimization problem AMPGO08"
function AMPGO08(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -10.0)

  @objective(
    nlp,
    Min,
    -(
      1 * cos(2 * x + 1) +
      2 * cos(3 * x + 2) +
      3 * cos(4 * x + 3) +
      4 * cos(5 * x + 4) +
      5 * cos(6 * x + 5) +
      6 * cos(7 * x + 6)
    )
  )

  return nlp
end
