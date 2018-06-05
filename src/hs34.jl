# Hock and Schittkowski problem number 34.
#
#   Source:
#   Problem 34 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification LGR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs34

"HS34 model"
function hs34(args...)
  
  nlp  = Model()
  x0   = [  0, 1.05, 2.9]
  uvar = [100,  100,  10]
  @variable(nlp, 0 <= x[i=1:3] <= uvar[i], start = x0[i])

  @NLconstraint(nlp, x[2] - exp(x[1]) >= 0)
  @NLconstraint(nlp, x[3] - exp(x[2]) >= 0)

  @objective(
    nlp,
    Min,
    -x[1]
  )

  return nlp
end