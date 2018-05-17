# Hock and Schittkowski problem number 74.
#
#   Source:
#   Problem 74 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PGR-AN-4-5
#
# A. Montoison, Montreal, 05/2018.

export hs74

"HS74 model"
function hs74(args...)
  nlp = Model()

  a  = 0.55
  x0 = [0,0,0,0]
  @variable(nlp, x[i=1:4], start=x0[i])

  @constraint(nlp, x[4] - x[3] + a >= 0)
  @constraint(nlp, x[3] - x[4] + a >= 0)
  @NLconstraint(nlp, 1000*sin(-x[3] - 0.25) + 1000*sin(     - x[4] - 0.25) + 894.8 -x[1] == 0)
  @NLconstraint(nlp, 1000*sin( x[3] - 0.25) + 1000*sin(x[3] - x[4] - 0.25) + 894.8 -x[2] == 0)
  @NLconstraint(nlp, 1000*sin( x[4] - 0.25) + 1000*sin(x[4] - x[3] - 0.25) + 1294.8      == 0)

  @constraint(nlp, 0  <= x[1] <= 1200)
  @constraint(nlp, 0  <= x[2] <= 1200)
  @constraint(nlp, -a <= x[3] <= a)
  @constraint(nlp, -a <= x[4] <= a)
  

  @NLobjective(
    nlp,
    Min,
    3*x[1] + 1e-6*x[1]^3 + 2*x[2] + (2/3)*10e-6*x[2]^3
    )

  return nlp
end