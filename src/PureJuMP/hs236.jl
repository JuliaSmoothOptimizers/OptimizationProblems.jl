# Hock and Schittkowski problem number 236.
#
#   Source:
#   Problem 236 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs236

"HS236 model"
function hs236(args...; kwargs...)
  nlp = Model()
  x0 = [90, 10]
  lvar = [0, 0]
  uvar = [75, 65]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  B= [
    75.1963666677
    -3.8112755343
    0.1269366345
    -0.0020567665
    0.0000103450
    -6.8306567613
    0.0302344793
    -0.0012813448
    0.0000352559
    -0.0000002266
    0.2564581253
    -0.0034604030
    0.0000135139
    28.1064434908
    -0.0000052375
    -0.0000000063
    0.0000000007
    0.0003405462
    -0.0000016638
    -2.8673112392
  ]

  @NLobjective(nlp, Min, B[1] + B[2] * x[1] + B[3] * x[1]^2 + B[4] * x[1]^3 + B[5] * x[1]^4 + B[6] * x[2] + B[7] * x[1] * x[2] + B[8] * x[1]^2 * x[2] + B[9] * x[1]^3 * x[2] + B[10] * x[1]^4 * x[2] + B[11] * x[2]^2 + B[12] * x[2]^3 + B[13] * x[2]^4 + B[14] * (1 / (1 + x[2])) + B[15] * x[1]^2 * x[2]^2 + B[16] * x[1]^3 * x[2]^2 + B[17] * x[1]^3 * x[2]^3 + B[18] * x[1] * x[2]^2 + B[19] * x[1] * x[2]^3 + B[20] * exp(0.0005 * x[1] * x[2]))
  @NLconstraint(nlp, x[1] * x[2] - 700 >= 0)
  @NLconstraint(nlp, x[2] - 5 * (x[1] / 25)^2 >= 0)
  return nlp
end
