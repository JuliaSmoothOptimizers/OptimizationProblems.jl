# Hock and Schittkowski problem number 20.
#
#   Source:
#   Problem 20 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-2-3
#
# N. Antunes, Curitiba, 10/2016.

export hs20

"HS20 model"
function hs20(args...)

  nlp = Model()
  x0 = [-2.0, 1.0]

  @variable(nlp, x[i=1:2], start=x0[i])

  @NLobjective(
    nlp,
    Min,
    100*(x[2] - x[1]^2)^2 + (1-x[1])^2
  )

  @NLconstraint(
    nlp,
    constr,
    x[1] + x[2]^2 >= 0
  )

  @NLconstraint(
    nlp,
    constr,
    x[1]^2 + x[2] >= 0
  )

  @NLconstraint(
    nlp,
    constr,
    x[1]^2 + x[2]^2 >= 1
  )

  @NLconstraint(
    nlp,
    constr,
    -1/2 <= x[1] <= 1/2
  )

  return nlp
end
