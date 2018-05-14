# Hock and Schittkowski problem number 44.
#
#   Source:
#   Problem 44 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-4-6
#
# A. Montoison, Montreal, 05/2018.

export hs44

"HS44 model"
function hs44(args...)
  nlp = Model()

  x0 = [0,0,0,0]
  @variable(nlp, x[i=1:4], start=x0[i])

  @constraint(nlp, 8  -   x[1] - 2*x[2] >= 0)
  @constraint(nlp, 12 - 4*x[1] -   x[2] >= 0)
  @constraint(nlp, 12 - 3*x[1] - 4*x[2] >= 0)
  @constraint(nlp, 8  - 2*x[3] -   x[4] >= 0)
  @constraint(nlp, 8  -   x[3] - 2*x[4] >= 0)
  @constraint(nlp, 5  -   x[3] -   x[4] >= 0)

  @constraint(nlp, 0 <= x[1])
  @constraint(nlp, 0 <= x[2])
  @constraint(nlp, 0 <= x[3])
  @constraint(nlp, 0 <= x[4])

  @NLobjective(
    nlp,
    Min,
    x[1] - x[2] - x[3] - x[1]*x[3] + x[1]*x[4] + x[2]*x[3] - x[2]*x[4]
  )

  return nlp
end