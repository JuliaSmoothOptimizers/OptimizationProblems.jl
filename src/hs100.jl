# Hock and Schittkowski problem number 100.
#
#   Source:
#   Problem 100 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PPR-AN-7-4
#
# A. Montoison, Montreal, 05/2018.

export hs100

"HS100 model"
function hs100(args...)

  nlp  = Model()
  x0   = [1, 2, 0, 4, 0, 1, 1]
  @variable(nlp, x[i=1:7], start = x0[i])

  @NLconstraint(nlp, 127 -  2*x[1]^2 - 3*x[2]^4 -    x[3]   - 4*x[4]^2 - 5*x[5] ≥ 0)
  @NLconstraint(nlp, 282 -  7*x[1]   - 3*x[2]   - 10*x[3]^2 -   x[4]   +   x[5] ≥ 0)
  @NLconstraint(nlp, 196 - 23*x[1] - x[2]^2 -  6*x[6]^2 + 8*x[7] ≥ 0)
  @NLconstraint(nlp, -4*x[1]^2 - x[2]^2 + 3*x[1]*x[2] - 2*x[3]^2 - 5*x[6] + 11*x[7] ≥ 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 10)^2 + 5*(x[2] - 12)^2 + x[3]^4 + 3*(x[4] - 11)^2 + 10*x[5]^6 
    + 7*x[6]^2 + x[7]^4 - 4*x[6]*x[7] - 10*x[6] - 8*x[7]
  )

  return nlp
end