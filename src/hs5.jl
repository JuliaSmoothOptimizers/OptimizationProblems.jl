# Hock and Schittkowski problem number 5.
#
#   Source:
#   Problem 5 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs5

"HS5 model"
function hs5(args...)

  nlp = Model()
  x0 = [0, 0]

  @variable(nlp, x[i=1:2], start=x0[i])

  @NLobjective(
    nlp,
    Min,
    sin(x[1]+x[2]) + (x[1]-x[2])^2 - 1.5*x[1] + 2.5*x[2] + 1
  )

  @NLconstraint(
    nlp,
    constr,
    -1.5 <= x[1] <= 4
  )

  @NLconstraint(
    nlp,
    constr,
    -3 <= x[2] <= 3
  )

  return nlp
end
