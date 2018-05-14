# Hock and Schittkowski problem number 37.
#
#   Source:
#   Problem 37 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs37

"HS37 model"
function hs37(args...)
  nlp = Model()

  x0 = [10,10,10]
  @variable(nlp, x[i=1:3], start=x0[i])

  @constraint(nlp, 72 - x[1] - 2*x[2] - 2*x[3] >= 0)
  @constraint(nlp, x[1] + 2*x[2] + 2*x[3] >= 0)
  @constraint(nlp, 0 <= x[1] <= 42)
  @constraint(nlp, 0 <= x[2] <= 42)
  @constraint(nlp, 0 <= x[3] <= 42)

  @NLobjective(
    nlp,
    Min,
    - x[1]*x[2]*x[3]
  )

  return nlp
end