# Hock and Schittkowski problem number 93.
#
#   Source:
#   Problem 93 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PPR-AN-6-2
#
# A. Montoison, Montreal, 05/2018.

export hs93

"HS93 model"
function hs93(args...)
  
  nlp  = Model()
  x0   = [5.54, 4.4, 12.02, 11.82, 0.702, 0.852]
  @variable(nlp, x[i=1:6] >= 0, start=x0[i])

  @NLconstraint(nlp, 0.001*prod(x[i] for i=1:6) - 2.07 >= 0)
  @NLconstraint(nlp, 1 - 0.00062*x[1]*x[4]*x[5]^2*(x[1] + x[2] + x[3]) 
  - 0.00058*x[2]*x[3]*x[6]^2*(x[1] + 1.57*x[2] + x[4]) >= 0)
  
  @NLobjective(
    nlp,
    Min,
    0.204*x[1]*x[4]*(x[1] + x[2] + x[3]) 
    + 0.0187*x[2]*x[3]*(x[1] + 1.57*x[2] + x[4])
    + 0.0607*x[1]*x[4]*x[5]^2*(x[1] + x[2] + x[3]) 
    + 0.0437*x[2]*x[3]*x[6]^2*(x[1] + 1.57*x[2] + x[4])
  )

  return nlp
end