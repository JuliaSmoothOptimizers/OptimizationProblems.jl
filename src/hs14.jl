# Hock and Schittkowski problem number 14.
#
#   Source:
#   Problem 14 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs14

"HS14 model"
function hs14(args...)

  nlp = Model()

  @variable(nlp, x[i=1:2], start=2)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 2)^2 + (x[2]-1)^2
  )

  @NLconstraint(
    nlp,
    constr,
    x[1]^2/4 + x[2]^2 <= 1
  )

  @NLconstraint(
    nlp,
    constr,
    x[1] - 2*x[2] == -1
  )

  return nlp
end
