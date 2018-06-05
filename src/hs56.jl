# Hock and Schittkowski problem number 56.
#
#   Source:
#   Problem 56 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PGR2-AN-7-4
#
# A. Montoison, Montreal, 05/2018.

export hs56

"HS56 model"
function hs56(args...)
  
  nlp  = Model()
  a    = asin(sqrt(1/4.2))
  b    = asin(sqrt(5/7.2))
  x0   = [1, 1, 1, a, a, a, b]
  @variable(nlp, x[i=1:7], start = x0[i])

  @NLconstraint(nlp, x[1] - 4.2*sin(x[4])^2 == 0)
  @NLconstraint(nlp, x[2] - 4.2*sin(x[5])^2 == 0)
  @NLconstraint(nlp, x[3] - 4.2*sin(x[6])^2 == 0)
  @NLconstraint(nlp, x[1] + 2*x[2] + 2*x[3] - 7.2*sin(x[7])^2 == 0)

  @NLobjective(
    nlp,
    Min,
    -x[1]*x[2]*x[3]
  )

  return nlp
end