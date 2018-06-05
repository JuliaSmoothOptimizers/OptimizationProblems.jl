# Hock and Schittkowski problem number 52.
#
#   Source:
#   Problem 52 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs52

"HS52 model"
function hs52(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:5], start = 2)

  @constraint(nlp, x[1] + 3*x[2] == 0)
  @constraint(nlp, x[3] + x[4] - 2*x[5] == 0)
  @constraint(nlp, x[2] - x[5] == 0)

  @NLobjective(
    nlp,
    Min,
    (4*x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2
  )

  return nlp
end