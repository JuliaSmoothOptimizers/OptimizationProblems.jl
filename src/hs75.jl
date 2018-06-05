# Hock and Schittkowski problem number 75.
#
#   Source:
#   Problem 75 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PGR-AN-4-5
#
# A. Montoison, Montreal, 05/2018.

export hs75

"HS75 model"
function hs75(args...)

  a    = 0.48
  nlp  = Model()
  lvar = [0,       0, -a, -a]
  uvar = [1200, 1200,  a,  a]
  @variable(nlp, lvar[i] <= x[i=1:4] <= uvar[i], start = 0)

  @constraint(nlp, -a <= x[4] - x[3] <= a)
  @NLconstraint(nlp, 1000*sin(-x[3] - 0.25) + 1000*sin(     - x[4] - 0.25) + 894.8 - x[1] == 0)
  @NLconstraint(nlp, 1000*sin( x[3] - 0.25) + 1000*sin(x[3] - x[4] - 0.25) + 894.8 - x[2] == 0)
  @NLconstraint(nlp, 1000*sin( x[4] - 0.25) + 1000*sin(x[4] - x[3] - 0.25) + 1294.8       == 0)

  @NLobjective(
    nlp,
    Min,
    3*x[1] + 1e-6*x[1]^3 + 2*x[2] + 1e-6*(2/3)*x[2]^3
  )

  return nlp
end