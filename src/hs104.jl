# Hock and Schittkowski problem number 104.
#
#   Source:
#   Problem 104 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PPR-AN-8-6
#
# A. Montoison, Montreal, 05/2018.

export hs104

"HS104 model"
function hs104(args...)
  
  nlp  = Model()
  x0   = [6, 3, 0.4, 0.2, 6, 6, 1, 0.5]
  @variable(nlp, 0.1 <= x[i=1:8] <= 10, start=x0[i])

  @NLexpression(nlp, f, 0.4*(x[1]/x[7])^(0.67) + 0.4*(x[2]/x[8])^(0.67) + 10 - x[1] - x[2])

  @NLconstraint(nlp, 1 - 0.0588*x[5]*x[7] - 0.1*x[1] >= 0)
  @NLconstraint(nlp, 1 - 0.0588*x[6]*x[8] - 0.1*x[1] - 0.1*x[2] >= 0)
  @NLconstraint(nlp, 1 - 4*x[3]/x[5] - 2*x[3]^(-0.71)/x[5] - 0.0588*x[3]^(-1.3)*x[7] >= 0)
  @NLconstraint(nlp, 1 - 4*x[4]/x[6] - 2*x[4]^(-0.71)/x[6] - 0.0588*x[4]^(-1.3)*x[8] >= 0)
  @NLconstraint(nlp, 1 <= f <= 4.2)

  @NLobjective(
    nlp,
    Min,
    f
  )

  return nlp
end