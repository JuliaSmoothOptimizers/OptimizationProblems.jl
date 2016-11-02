# Hock and Schittkowski problem number 18.
#
#   Source:
#   Problem 18 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-2-2
#
# N. Antunes, Curitiba, 10/2016.

export hs18

"HS18 model"
function hs18(args...)

  nlp = Model()

  @variable(nlp, x[i=1:2], start=2.0)

  @NLobjective(
    nlp,
    Min,
    x[1]^2/100 + x[2]^2
  )

  @NLconstraint(
    nlp,
    constr,
    x[1]*x[2] >= 25
  )

  @NLconstraint(
    nlp,
    constr,
    x[1]^2 + x[2]^2 >= 25
  )

  @NLconstraint(
    nlp,
    constr,
    2 <= x[1] <= 50
  )

  @NLconstraint(
    nlp,
    constr,
    0 <= x[2] <= 50
  )

  return nlp
end
