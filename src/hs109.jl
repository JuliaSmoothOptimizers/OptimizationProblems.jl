# Hock and Schittkowski problem number 109.
#
#   Source:
#   Problem 109 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PGR-AN-9-10
#
# A. Montoison, Montreal, 05/2018.

export hs109

"HS109 model"
function hs109(args...)
  
  nlp  = Model()
  lvar = [0,     0, -0.55, -0.55, 196, 196, 196, -400, -400]
  uvar = [Inf, Inf,  0.55,  0.55, 252, 252, 252,  800,  800]
  @variable(nlp, lvar[i] <= x[i=1:9] <= uvar[i], start = 0)
  
  a = 50.176
  b = sin(0.25)
  c = cos(0.25)
  @constraint(nlp, -0.55 <= x[4] - x[3] <= 0.55)
  @NLconstraint(nlp, 2250000 - x[1]^2 - x[8]^2 >= 0)
  @NLconstraint(nlp, 2250000 - x[2]^2 - x[9]^2 >= 0)
  @NLconstraint(nlp, x[5]*x[6]*sin(-x[3] - 1/4) + x[5]*x[7]*sin(-x[4] - 1/4)       + 2*b*x[5]^2 - a*x[1] +     400*a == 0)
  @NLconstraint(nlp, x[5]*x[6]*sin( x[3] - 1/4) + x[6]*x[7]*sin(x[3] - x[4] - 1/4) + 2*b*x[6]^2 - a*x[2] +     400*a == 0)
  @NLconstraint(nlp, x[5]*x[7]*sin( x[4] - 1/4) + x[6]*x[7]*sin(x[4] - x[3] - 1/4) + 2*b*x[7]^2          + 881.779*a == 0)
  @NLconstraint(nlp, a*x[8] + x[5]*x[6]*cos(-x[3] - 1/4) + x[5]*x[7]*cos(-x[4] - 1/4)       - 200*a    - 2*c*x[5]^2 + 0.7533e-3*a*x[5]^2 == 0)
  @NLconstraint(nlp, a*x[9] + x[5]*x[6]*cos( x[3] - 1/4) + x[6]*x[7]*cos(x[3] - x[4] - 1/4) - 200*a    - 2*c*x[6]^2 + 0.7533e-3*a*x[6]^2 == 0)
  @NLconstraint(nlp,          x[5]*x[7]*cos( x[4] - 1/4) + x[6]*x[7]*cos(x[4] - x[3] - 1/4) + 22.938*a - 2*c*x[7]^2 + 0.7533e-3*a*x[7]^2 == 0)

  @NLobjective(
    nlp,
    Min,
    3*x[1] + 1e-6*x[1]^3 + 2*x[2] + 0.522074e-6*x[2]^3
  )

  return nlp
end