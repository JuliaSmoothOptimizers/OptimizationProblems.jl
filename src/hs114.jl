# Hock and Schittkowski problem number 114.
#
#   Source:
#   Problem 114 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QGR-AN-10-11
#
# A. Montoison, Montreal, 05/2018.

export hs114

"HS114 model"
function hs114(args...)
  
  nlp  = Model()
  x0   = [   1745,   12000,     110,    3048,    1974, 89.2, 92.8,  8, 3.6, 145]
  lvar = [0.00001, 0.00001, 0.00001, 0.00001, 0.00001,   85,   90,  3, 1.2, 145]
  uvar = [   2000,   16000,     120,    5000,    2000,   93,   95, 12,   4, 162]
  @variable(nlp, lvar[i] ≤ x[i=1:10] ≤ uvar[i], start=x0[i])
  
  a = 0.99
  b = 0.9

  @expression(nlp, g1, 35.82 - 0.222*x[10] - b*x[9])
  @expression(nlp, g2, -133 + 3*x[7] - a*x[10])
  @NLexpression(nlp, g5, 1.12*x[1] + .13167*x[1]*x[8] - .00667*x[1]*x[8]^2 - a*x[4])
  @NLexpression(nlp, g6, 57.425 + 1.098*x[8] - .038*x[8]^2 + .325*x[6] - a*x[7])

  @constraint(nlp, g1 ≥ 0)
  @constraint(nlp, g2 ≥ 0)
  @constraint(nlp, -g1 + x[9]*(1/b - b) ≥ 0)
  @constraint(nlp, -g2 + (1/a - a)*x[10] ≥ 0)
  @NLconstraint(nlp, g5 ≥ 0)
  @NLconstraint(nlp, g6 ≥ 0)
  @NLconstraint(nlp, -g5 + (1/a - a)*x[4] ≥ 0)
  @NLconstraint(nlp, -g6 + (1/a - a)*x[7] ≥ 0)
  @constraint(nlp, 1.22*x[4] - x[1] - x[5] == 0)
  @NLconstraint(nlp, 98000*x[3]/(x[4]*x[9] + 1000*x[3]) - x[6] == 0)
  @NLconstraint(nlp, (x[2] + x[5])/x[1] - x[8] == 0)

  @NLobjective(
    nlp,
    Min,
    5.04*x[1] + 0.035*x[2] + 10*x[3] + 3.36*x[5] - 0.063*x[4]*x[7]
  )

  return nlp
end