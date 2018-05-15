# Hock and Schittkowski problem number 55.
#
#   Source:
#   Problem 55 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GLR2-AN-6-6
#
# A. Montoison, Montreal, 05/2018.

export hs55

"HS55 model"
function hs55(args...)
  nlp = Model()

  x0 = [1,2,0,0,0,2]
  @variable(nlp, x[i=1:6], start=x0[i])

  @constraint(nlp, x[1] + 2*x[2] + 5*x[5] - 6 == 0)
  @constraint(nlp, x[3] + x[2] + x[3] - 3 == 0)
  @constraint(nlp, x[4] + x[5] + x[6] - 2 == 0)
  @constraint(nlp, x[1] + x[4] - 1 == 0)
  @constraint(nlp, x[2] + x[5] - 2 == 0)
  @constraint(nlp, x[3] + x[6] - 2 == 0)

  for i=1:6
    @constraint(nlp, 0 <= x[i])
  end
  @constraint(nlp, x[1] <= 1)
  @constraint(nlp, x[4] <= 1)

  @NLobjective(
    nlp,
    Min,
    x[1] + 2*x[2] + 4*x[5] + exp(x[1]*x[4])
  )

  return nlp
end