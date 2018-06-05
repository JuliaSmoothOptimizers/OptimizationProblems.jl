# Hock and Schittkowski problem number 51.
#
#   Source:
#   Problem 51 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs51

"HS51 model"
function hs51(args...)
  
  nlp  = Model()
  x0   = [2.5, 0.5, 2, -1, 0.5]
  @variable(nlp, x[i=1:5], start = x0[i])

  @constraint(nlp, x[1] + 3*x[2] - 4 == 0)
  @constraint(nlp, x[3] + x[4] - 2*x[5] == 0)
  @constraint(nlp, x[2] - x[5] == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2
  )

  return nlp
end