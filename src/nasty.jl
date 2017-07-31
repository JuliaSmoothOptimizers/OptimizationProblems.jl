#   Nasty problem.
#
#   Source: a very simple box-constrained quadratic
#
#   classification QUR2-AN-2-0

export nasty

"Nasty problem"
function nasty(args...)

  nlp = Model()

  x0 = [1.0e-30, 1.0]

  @variable(nlp, x[i=1:2], start=x0[i])

  @NLobjective(
    nlp,
    Min,
    0.5 * ((1.0e10 * x[1])^2 + x[2]^2)
  )

  return nlp
end
