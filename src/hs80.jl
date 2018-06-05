# Hock and Schittkowski problem number 80.
#
#   Source:
#   Problem 80 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GPR-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs80

"HS80 model"
function hs80(args...)
  
  nlp  = Model()
  x0   = [  -2,    2,    2,   -1,   -1]
  lvar = [-2.3, -2.3, -3.2, -3.2, -3.2]
  uvar = [ 2.3,  2.3,  3.2,  3.2,  3.2]
  @variable(nlp, lvar[i] <= x[i=1:5] <= uvar[i], start=x0[i])

  @NLconstraint(nlp, sum(x[i]^2 for i=1:5) - 10 == 0)
  @NLconstraint(nlp, x[2]*x[3] - 5*x[4]*x[5] == 0)
  @NLconstraint(nlp, x[1]^3 + x[2]^3 + 1 == 0)

  @NLobjective(
    nlp,
    Min,
    exp(prod(x[i] for i=1:5))
  )

  return nlp
end