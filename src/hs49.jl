# Hock and Schittkowski problem number 49.
#
#   Source:
#   Problem 49 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-5-2
#
# A. Montoison, Montreal, 05/2018.

export hs49

"HS49 model"
function hs49(args...)
  
  nlp  = Model()
  x0   = [10, 7, 2, -3, 0.8]
  @variable(nlp, x[i=1:5], start = x0[i])

  @constraint(nlp, x[1] + x[2] + x[3] + 4*x[4] - 7 == 0)
  @constraint(nlp, x[3] + 5*x[5] - 6 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6
  )

  return nlp
end