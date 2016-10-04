# Hock and Schittkowski problem number 112.
#
#   Source:
#   Problem 112 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs112

"HS112 model"
function hs112(args...)

  nlp = Model()

  c = [-6.089, -17.164, -34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]

  @variable(nlp, x[i=1:10], start=0.1)

  @NLobjective(
    nlp,
    Min,
    sum{x[j]*(c[j]+ log(x[j]/(sum{x[k], k=1:10}))), j=1:10}
  )

  @NLconstraint(
    nlp,
    constr,
    x[1] + 2*x[2] + 2*x[3] + x[6] + x[10] - 2 == 0
  )

  @NLconstraint(
    nlp,
    constr,
    x[4] + 2*x[5] + x[6] + x[7] - 1 == 0
  )

  @NLconstraint(
    nlp,
    constr,
    x[3] + x[7] + x[8] + 2*x[9] + x[10] - 1 == 0
  )

  return nlp
end
