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
  
  nlp  = Model()
  uvar = [1, 1, 1, 2]
  @variable(nlp, 0 <= x[i=1:4] <= uvar[i], start = 2)

  @constraint(nlp, x[1] + 2*x[2] + 2*x[3] - x[4] == 0)

  @NLobjective(
    nlp,
    Min,
    2 - x[1]*x[2]*x[3]
  )

  return nlp
end