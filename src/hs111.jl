# Hock and Schittkowski problem number 111.
#
#   Source:
#   Problem 111 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OOR2-AN-10-3
#
# N. Antunes, Curitiba, 10/2016.

export hs111

"HS111 model"
function hs111(args...)

  nlp = Model()
  c   = [-6.089, -17.164, -34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]
  @variable(nlp, -100 ≤ x[i=1:10] ≤ 100, start = -2.3)

  @NLobjective(
    nlp,
    Min,
    sum(exp(x[j])*(c[j] + x[j] - log(sum(exp(x[k]) for k=1:10))) for j=1:10)
  )

  @NLconstraint(
    nlp,
    exp(x[1]) + 2*exp(x[2]) + 2*exp(x[3]) + exp(x[6]) + exp(x[10]) - 2 == 0
  )

  @NLconstraint(
    nlp,
    exp(x[4]) + 2*exp(x[5]) + exp(x[6]) + exp(x[7]) - 1 == 0
  )

  @NLconstraint(
    nlp,
    exp(x[3]) + exp(x[7]) + exp(x[8]) + 2*exp(x[9]) + exp(x[10]) - 1 == 0
  )

  return nlp
end
