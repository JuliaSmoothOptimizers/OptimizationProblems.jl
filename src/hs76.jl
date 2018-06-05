# Hock and Schittkowski problem number 76.
#
#   Source:
#   Problem 76 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR-AN-4-3
#
# A. Montoison, Montreal, 05/2018.

export hs76

"HS76 model"
function hs76(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:4] >= 0, start = 0.5)

  @constraint(nlp, - 5 +   x[1] + 2*x[2] +   x[3] + x[4] <= 0)
  @constraint(nlp, - 4 + 3*x[1] +   x[2] + 2*x[3] - x[4] <= 0)
  @constraint(nlp, x[2] + 4*x[3] - 1.5 >= 0)

  @NLobjective(
    nlp,
    Min,
    x[1]^2 + 0.5*x[2]^2 + x[3]^2 + 0.5*x[4]^2 -x[1]*x[3] + x[3]*x[4] - x[1] - 3*x[2] + x[3] - x[4]
  )

  return nlp
end