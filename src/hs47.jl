# Hock and Schittkowski problem number 47.
#
#   Source:
#   Problem 47 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PPR2-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs47

"HS47 model"
function hs47(args...)
 
  nlp  = Model()
  x0   = [2, sqrt(2), -1, 2-sqrt(2), 0.5]
  @variable(nlp, x[i=1:5], start = x0[i])

  @NLconstraint(nlp, x[1] + x[2]^2 + x[3]^3 - 3 == 0)
  @NLconstraint(nlp, x[2] - x[3]^2 + x[4] - 1 == 0)
  @NLconstraint(nlp, x[1]*x[5] - 1 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[2] - x[3])^3 + (x[3] - x[4])^4 + (x[4] - x[5])^4
  )

  return nlp
end