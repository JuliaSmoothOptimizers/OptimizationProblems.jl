# Hock and Schittkowski problem number 16.
#
#   Source:
#   Problem 16 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-2-2
#
# N. Antunes, Curitiba, 10/2016.

export hs16

"HS16 model"
function hs16(args...)

  nlp  = Model()
  x0   = [  -2,   1]
  lvar = [-0.5,-Inf]
  uvar = [ 0.5,   1]
  @variable(nlp, lvar[i] <= x[i=1:2] <= uvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
  )

  @NLconstraint(
    nlp,
    x[1]^2 + x[2] >= 0
  )

  @NLconstraint(
    nlp,
    x[1] + x[2]^2 >= 0
  )
  
  return nlp
end
