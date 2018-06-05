# Hock and Schittkowski problem number 116.
#
#   Source:
#   Problem 116 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QGR-AN-13-14
#
# A. Montoison, Montreal, 05/2018.

export hs116

"HS116 model"
function hs116(args...)
  
  nlp  = Model()
  x0   = [0.5, 0.8, 0.9,    0.1, 0.14, 0.5,  489,   80,  650, 450, 150,    150,    150]
  lvar = [0.1, 0.1, 0.1, 0.0001,  0.1, 0.1,  0.1,  0.1,  500, 0.1,   1, 0.0001, 0.0001]
  uvar = [  1,   1,   1,    0.1,  0.9, 0.9, 1000, 1000, 1000, 500, 150,    150,    150]
  @variable(nlp, lvar[i] <= x[i=1:13] <= uvar[i], start=x0[i])
  
  a = 0.002
  b = 1.262626
  c = 1.231059
  d = 0.03475
  e = 0.975
  f = 0.00975

  @constraint(nlp, x[3] - x[2] >= 0)
  @constraint(nlp, x[2] - x[1] >= 0)
  @constraint(nlp, 1 - a * x[7] + a * x[8] >= 0)
  @constraint(nlp, x[11] + x[12] + x[13] >= 50)
  @NLconstraint(nlp, x[13] - b * x[10] + c * x[3] * x[10] >= 0)
  @NLconstraint(nlp, x[5] - d * x[2] - e * x[2] * x[5] + f * x[2]^2 >= 0)
  @NLconstraint(nlp, x[6] - d * x[3] - e * x[3] * x[6] + f * x[3]^2 >= 0)
  @NLconstraint(nlp, x[4] - d * x[1] - e * x[1] * x[4] + f * x[1]^2 >= 0)
  @NLconstraint(nlp, x[12] - b * x[9] + c * x[2] * x[9] >= 0)
  @NLconstraint(nlp, x[11] - b * x[8] + c * x[1] * x[8] >= 0)
  @NLconstraint(nlp, x[5] * x[7] - x[1] * x[8] - x[4] * x[7] + x[4] * x[8] >= 0)
  @NLconstraint(nlp, 1 - a * (x[2] * x[9] + x[5] * x[8] - x[1] * x[8] - x[6] * x[9]) - x[5] - x[6] >= 0)
  @NLconstraint(nlp, x[2] * x[9] - x[3] * x[10] - x[6] * x[9] - 500 * x[2] + 500 * x[6] + x[2] * x[10] >= 0)
  @NLconstraint(nlp, x[2] - 0.9 - a * (x[2] * x[10] - x[3] * x[10]) >= 0)
  @constraint(nlp, x[11] + x[12] + x[13] <= 250)

  @objective(
    nlp,
    Min,
    x[11] + x[12] + x[13]
  )

  return nlp
end