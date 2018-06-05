# Hock and Schittkowski problem number 71.
#
#   Source:
#   Problem 71 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PPR2-AN-4-2
#
# A. Montoison, Montreal, 05/2018.

export hs71

"HS71 model"
function hs71(args...)
  
  nlp = Model()
  x0 = [1, 5, 5, 1]
  @variable(nlp, 1 <= x[i=1:4] <= 5, start=x0[i])

  @NLconstraint(nlp, x[1]*x[2]*x[3]*x[4] - 25 >= 0)
  @NLconstraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 - 40 == 0)

  @NLobjective(
    nlp,
    Min,
    x[1]*x[4]*(x[1] + x[2] + x[3]) + x[3]
  )

  return nlp
end