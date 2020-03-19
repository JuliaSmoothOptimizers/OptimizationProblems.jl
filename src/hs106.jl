# Hock and Schittkowski problem number 106.
#
#   Source:
#   Problem 106 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification LQR-AN-8-6
#
# A. Montoison, Montreal, 05/2018.

export hs106

"HS106 model"
function hs106(args...)
  
  nlp  = Model()
  x0   = [ 5000,  5000,  5000,  200,  350,  150,  225,  425]
  lvar = [  100,  1000,  1000,   10,   10,   10,   10,   10]
  uvar = [10000, 10000, 10000, 1000, 1000, 1000, 1000, 1000]
  @variable(nlp, lvar[i] ≤ x[i=1:8] ≤ uvar[i], start=x0[i])
  
  @constraint(nlp, 1 - 0.0025*(x[4] + x[6]) ≥ 0)
  @constraint(nlp, 1 - 0.0025*(x[5] + x[7] - x[4]) ≥ 0)
  @constraint(nlp, 1 - 0.01*(x[8] - x[5]) ≥ 0)
  @NLconstraint(nlp, x[1]*x[6] - 833.33252*x[4] - 100*x[1] + 83333.333 ≥ 0)
  @NLconstraint(nlp, x[2]*x[7] - 1250*x[5] - x[2]*x[4] + 1250*x[4] ≥ 0)
  @NLconstraint(nlp, x[3]*x[8] - 1250000 - x[3]*x[5] + 2500*x[5] ≥ 0)

  @objective(
    nlp,
    Min,
    x[1] + x[2] + x[3]
  )

  return nlp
end