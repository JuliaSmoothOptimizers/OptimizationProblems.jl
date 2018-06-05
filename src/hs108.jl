# Hock and Schittkowski problem number 108.
#
#   Source:
#   Problem 108 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QQR-AN-9-13
#
# A. Montoison, Montreal, 05/2018.

export hs108

"HS108 model"
function hs108(args...)
 
  nlp  = Model()
  lvar = [-Inf, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf, -Inf,   0]
  @variable(nlp, x[i=1:9] >= lvar[i], start = 1)
  

  @NLconstraint(nlp, 1 - x[3]^2 - x[4]^2 >= 0)
  @NLconstraint(nlp, 1 - x[5]^2 - x[6]^2 >= 0)
  @NLconstraint(nlp, 1 - (x[1] - x[5])^2 - (x[2] - x[6])^2 >= 0)
  @NLconstraint(nlp, 1 - (x[1] - x[7])^2 - (x[2] - x[8])^2 >= 0)
  @NLconstraint(nlp, 1 - (x[3] - x[5])^2 - (x[4] - x[6])^2 >= 0)
  @NLconstraint(nlp, 1 - (x[3] - x[7])^2 - (x[4] - x[8])^2 >= 0)
  @NLconstraint(nlp, x[3]*x[9] >= 0)
  @NLconstraint(nlp, x[5]*x[8] - x[6]*x[7] >= 0)
  @NLconstraint(nlp, 1 - x[9]^2 >= 0)
  @NLconstraint(nlp, 1 - x[1]^2 - (x[2] - x[9])^2 >= 0)
  @NLconstraint(nlp, x[1]*x[4] - x[2]*x[3] >= 0)
  @NLconstraint(nlp, - x[5]*x[9] >= 0)

  @NLobjective(
    nlp,
    Min,
    -0.5*(x[1]*x[4] - x[2]*x[3] + x[3]*x[9] - x[5]*x[9] + x[5]*x[8] - x[6]*x[7])
  )

  return nlp
end