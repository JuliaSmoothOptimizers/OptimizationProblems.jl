# Hock and Schittkowski problem number 48.
#
#   Source:
#   Problem 48 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-5-2
#
# A. Montoison, Montreal, 05/2018.

export hs48

"HS48 model"
function hs48(args...)
  
  nlp  = Model()
  x0   = [3, 5, -3, 2, -2]
  @variable(nlp, x[i=1:5], start = x0[i])

  @constraint(nlp, x[1] + x[2] + x[3] + x[4] + x[5] - 5 == 0)
  @constraint(nlp, x[3] - 2*(x[4] + x[5]) + 3 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)^2 + (x[2] - x[3])^2 + (x[4] - x[5])^2
  )

  return nlp
end