# Hock and Schittkowski problem number 28.
#
#   Source:
#   Problem 28 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-3-1
#
# A. Montoison, Montreal, 04/2018.

export hs28

"HS28 model"
function hs28(args...)
  
  nlp  = Model()
  x0   = [-4, 1, 1]
  @variable(nlp, x[i=1:3], start = x0[i])

  @constraint(nlp, x[1] + 2*x[2] + 3*x[3] - 1 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] + x[2])^2 + (x[2]+x[3])^2
  )

  return nlp
end
