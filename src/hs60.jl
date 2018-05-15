# Hock and Schittkowski problem number 60.
#
#   Source:
#   Problem 60 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PPR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs60

"HS60 model"
function hs60(args...)
  nlp = Model()

  x0 = [2,2,2]
  @variable(nlp, x[i=1:3], start=x0[i])

  @NLconstraint(nlp, x[1]*(1+x[2]^2) + x[3]^4 - 4 -3*sqrt(2) == 0)

  for i=1:3
    @constraint(nlp, -10 <= x[i] <= 10)
  end

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^4
  )

  return nlp
end