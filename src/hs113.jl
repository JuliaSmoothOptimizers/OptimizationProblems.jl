# Hock and Schittkowski problem number 113.
#
#   Source:
#   Problem 113 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QQR-AN-10-8
#
# A. Montoison, Montreal, 05/2018.

export hs113

"HS113 model"
function hs113(args...)

  nlp  = Model()
  x0   = [2, 3, 5, 5, 1, 2, 7, 3, 6, 10]
  @variable(nlp, x[i=1:10], start=x0[i])
  
  @constraint(nlp, 105 - 4*x[1] - 5*x[2] +  3*x[7] - 9*x[8] >= 0)
  @constraint(nlp, -10*x[1] + 8*x[2] + 17*x[7] - 2*x[8] >= 0)
  @constraint(nlp, 8*x[1] - 2*x[2] - 5*x[9] + 2*x[10] + 12 >=0)
  @NLconstraint(nlp, -3*(x[1] - 2)^2 - 4*(x[2] - 3)^2 - 2*x[3]^2 + 7*x[4] + 120 >= 0)
  @NLconstraint(nlp, -5*x[1]^2 - 8*x[2] - (x[3] - 6)^2 + 2*x[4] + 40 >= 0)
  @NLconstraint(nlp, -0.5*(x[1] - 8)^2 - 2*(x[2] - 4)^2 - 3*x[5]^2 + x[6] + 30 >= 0)
  @NLconstraint(nlp, - x[1]^2 - 2*(x[2] - 2)^2 + 2*x[1]*x[2] - 14*x[5] + 6*x[6] >= 0)
  @NLconstraint(nlp, 3*x[1] - 6*x[2] - 12*(x[9] - 8)^2 + 7*x[10] >= 0) 

  @NLobjective(
    nlp,
    Min,
    x[1]^2 + x[2]^2 + x[1]*x[2] - 14*x[1] - 16*x[2] + (x[3] - 10)^2 + 4*(x[4] - 5)^2
   + (x[5] - 3)^2 + 2*(x[6] - 1)^2 + 5*x[7]^2 + 7*(x[8] - 11)^2 + 2*(x[9]-10)^2
   + (x[10] - 7)^2 + 45
  )

  return nlp
end