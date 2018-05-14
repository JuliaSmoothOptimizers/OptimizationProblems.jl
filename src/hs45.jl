# Hock and Schittkowski problem number 45.
#
#   Source:
#   Problem 45 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PBR2-AN-5-0
#
# A. Montoison, Montreal, 05/2018.

export hs45

"HS45 model"
function hs45(args...)
  nlp = Model()

  x0 = [2,2,2,2,2]
  @variable(nlp, x[i=1:5], start=x0[i])

  for i=1:5
    @constraint(nlp, 0 <= x[i] <= i)
  end

  @NLobjective(
    nlp,
    Min,
    2 - (1/120)*x[1]*x[2]*x[3]*x[4]*x[5]
  )

  return nlp
end