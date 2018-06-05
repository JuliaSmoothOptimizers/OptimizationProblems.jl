# Hock and Schittkowski problem number 11.
#
#   Source:
#   Problem 11 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs11

"HS11 model"
function hs11(args...)

  nlp  = Model()
  x0   = [ 4.9,  0.1]
  @variable(nlp, x[i=1:2], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    (x[1] - 5)^2 + x[2]^2 -25
  )

  @NLconstraint(
    nlp,
    x[1]^2 <= x[2]
  )

  return nlp
end
