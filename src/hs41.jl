# Hock and Schittkowski problem number 41.
#
#   Source:
#   Problem 41 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-4-1
#
# A. Montoison, Montreal, 05/2018.

export hs41

"HS41 model"
function hs41(args...)
  nlp = Model()

  x0 = [2,2,2,2]
  @variable(nlp, x[i=1:4], start=x0[i])

  @constraint(nlp, x[1] + 2*x[2] + 2*x[3] - x[4] == 0)
  @constraint(nlp, 0 <= x[1] <= 1)
  @constraint(nlp, 0 <= x[2] <= 1)
  @constraint(nlp, 0 <= x[3] <= 1)
  @constraint(nlp, 0 <= x[4] <= 2)

  @NLobjective(
    nlp,
    Min,
    2 - x[1]*x[2]*x[3]
  )

  return nlp
end