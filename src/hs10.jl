# Hock and Schittkowski problem number 10.
#
#   Source:
#   Problem 10 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification LQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs10

"HS10 model"
function hs10(args...)

  nlp  = Model()
  x0   = [-10,    10]
  @variable(nlp, x[i=1:2], start = x0[i])

  @objective(
    nlp,
    Min,
    x[1] - x[2]
  )

  @NLconstraint(
    nlp,
    -3*x[1]^2 + 2*x[1]*x[2] - x[2]^2 + 1 >= 0
  )

  return nlp
end
