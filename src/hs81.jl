# Hock and Schittkowski problem number 81.
#
#   Source:
#   Problem 81 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GPR-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs81

"HS81 model"
function hs81(args...)
  nlp = Model()

  x0 = [-2,2,2,-1,-1]
  @variable(nlp, x[i=1:5], start=x0[i])

  @NLconstraint(nlp, sum(x[i]^2 for i=1:5) - 10 == 0)
  @NLconstraint(nlp, x[2]*x[3] - 5*x[4]*x[5] == 0)
  @NLconstraint(nlp, x[1]^3 + x[2]^3 + 1 == 0)

  @constraint(nlp, -2.3 <= x[1] <= 2.3)
  @constraint(nlp, -2.3 <= x[2] <= 2.3)
  @constraint(nlp, -3.2 <= x[3] <= 3.2)
  @constraint(nlp, -3.2 <= x[4] <= 3.2)
  @constraint(nlp, -3.2 <= x[5] <= 3.2)

  @NLobjective(
    nlp,
    Min,
    exp(prod(x[i] for i=1:5) - 0.5*(x[1]^3 + x[2]^3 + 1)^2)
    )

  return nlp
end