# Hock and Schittkowski problem number 107.
#
#   Source:
#   Problem 107 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PGR-AN-9-6
#
# A. Montoison, Montreal, 05/2018.

export hs107

"HS107 model"
function hs107(args...)

  nlp  = Model()
  x0   = [0.8, 0.8,  0.2,  0.2,  1.0454,  1.0454,  1.0454,    0,    0]
  lvar = [  0,   0, -Inf, -Inf, 0.90909, 0.90909, 0.90909, -Inf, -Inf]
  uvar = [Inf, Inf,  Inf,  Inf,  1.0909,  1.0909,  1.0909,  Inf,  Inf]
  @variable(nlp, lvar[i] <= x[i=1:9] <= uvar[i], start=x0[i])
  
  c = (48.4/50.176)*sin(0.25)
  d = (48.4/50.176)*cos(0.25)

  @NLexpression(nlp, y1, sin(x[8]))
  @NLexpression(nlp, y2, cos(x[8]))
  @NLexpression(nlp, y3, sin(x[9]))
  @NLexpression(nlp, y4, cos(x[9]))
  @NLexpression(nlp, y5, sin(x[8] - x[9]))
  @NLexpression(nlp, y6, cos(x[8] - x[9]))

  @NLconstraint(nlp, 0.4    - x[1] + 2*c*x[5]^2 - x[5]*x[6]*(d*y1 + c*y2) - x[5]*x[7]*(d*y3 + c*y4) == 0)
  @NLconstraint(nlp, 0.4    - x[2] + 2*c*x[6]^2 + x[5]*x[6]*(d*y1 - c*y2) + x[6]*x[7]*(d*y5 - c*y6) == 0)
  @NLconstraint(nlp, 0.8           + 2*c*x[7]^2 + x[5]*x[7]*(d*y3 - c*y4) - x[6]*x[7]*(d*y5 + c*y6) == 0)
  @NLconstraint(nlp, 0.2    - x[3] + 2*d*x[5]^2 + x[5]*x[6]*(c*y1 - d*y2) + x[5]*x[7]*(c*y3 - d*y4) == 0)
  @NLconstraint(nlp, 0.2    - x[4] + 2*d*x[6]^2 - x[5]*x[6]*(c*y1 + d*y2) - x[6]*x[7]*(c*y5 + d*y6) == 0)
  @NLconstraint(nlp, -0.337        + 2*d*x[7]^2 - x[5]*x[7]*(c*y3 + d*y4) + x[6]*x[7]*(c*y5 - d*y6) == 0)

  @NLobjective(
    nlp,
    Min,
    3000*x[1] + 1000*x[1]^3 + 2000*x[2] + 666.667*x[2]^3
  )

  return nlp
end