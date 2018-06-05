# Hock and Schittkowski problem number 59.
#
#   Source:
#   Problem 59 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GQR2-AN-2-3
#
# A. Montoison, Montreal, 05/2018.

export hs59

"HS59 model"
function hs59(args...)
  
  nlp  = Model()
  x0   = [90, 10]
  uvar = [75, 65]
  @variable(nlp, 0 <= x[i=1:2] <= uvar[i], start=x0[i])

  @NLconstraint(nlp, x[1]*x[2] - 700 >= 0)
  @NLconstraint(nlp, x[2] - (x[1]^2)/125  >= 0)
  @NLconstraint(nlp, (x[2] - 50)^2 -5*(x[1] - 55) >= 0)

  @NLobjective(
    nlp,
    Min,
    -75.196 + 3.8112*x[1] + 0.0020567*x[1]^3 - 1.0345e-5*x[1]^4
    + 6.8306*x[2] - 0.030234*x[1]*x[2] + 1.28134e-3*x[2]*x[1]^2
    + 2.266e-7*(x[1]^4)*x[2] - 0.25645*x[2]^2 + 0.0034604*x[2]^3 - 1.3514e-5*x[2]^4
    + 28.106/(x[2] + 1) + 5.2375e-6*(x[1]^2)*(x[2]^2) + 6.3e-8*(x[1]^3)*(x[2]^2)
    - 7e-10*(x[1]^3)*(x[2]^3) - 3.405e-4*x[1]*(x[2]^2) + 1.6638e-6*x[1]*(x[2]^3)
    + 2.8673*exp(0.0005*x[1]*x[2]) - 3.5256e-5*(x[1]^3)*x[2] -0.12694*x[1]^2
  )

  return nlp
end