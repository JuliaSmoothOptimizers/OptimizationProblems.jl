# Hock and Schittkowski problem number 79.
#
#   Source:
#   Problem 79 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PPR-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs79

"HS79 model"
function hs79(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:5], start = 2)

  @NLconstraint(nlp, x[1] + x[2]^2 + x[3]^3 - 2 - 3*sqrt(2) == 0)
  @NLconstraint(nlp, x[2] - x[3]^2 + x[4]   + 2 - 2*sqrt(2) == 0)
  @NLconstraint(nlp, x[1]*x[5] - 2 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^4
  )

  return nlp
end