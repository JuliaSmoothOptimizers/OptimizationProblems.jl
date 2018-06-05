# Hock and Schittkowski problem number 24.
#
#   Source:
#   Problem 24 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-2-3
#
# A. Montoison, Montreal, 04/2018.

export hs24

"HS24 model"
function hs24(args...)

  nlp  = Model()
  x0   = [  1, 0.5]
  @variable(nlp, x[i=1:2] >= 0, start = x0[i])

  @constraint(nlp, x[1]/sqrt(3) - x[2] >= 0)
  @constraint(nlp, 0 <= x[1] + sqrt(3)*x[2] <= 6)

  @NLobjective(
    nlp,
    Min,
    1/(27*sqrt(3))*((x[1]-3)^2 - 9)*x[2]^3
  )

  return nlp
end
