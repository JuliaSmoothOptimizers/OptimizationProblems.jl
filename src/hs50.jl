# Hock and Schittkowski problem number 50.
#
#   Source:
#   Problem 50 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs50

"HS50 model"
function hs50(args...)
  
  nlp  = Model()
  x0   = [35,-31,11,5,-5]
  @variable(nlp, x[i=1:5], start = x0[i])

  @constraint(nlp, x[1] + 2*x[2] + 3*x[3] - 6 == 0)
  @constraint(nlp, x[2] + 2*x[3] + 3*x[4] - 6 == 0)
  @constraint(nlp, x[3] + 2*x[4] + 3*x[5] - 6 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^2
  )

  return nlp
end