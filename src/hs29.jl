# Hock and Schittkowski problem number 29.
#
#   Source:
#   Problem 29 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PQR2-AN-3-1
#
# A. Montoison, Montreal, 04/2018.

export hs29

"HS29 model"
function hs29(args...)

  nlp  = Model()
  lvar = [-Inf, -Inf, -Inf]
  uvar = [ Inf,  Inf,  Inf]
  @variable(nlp, lvar[i] <= x[i=1:3] <= uvar[i], start = 1)

  @NLconstraint(nlp, x[1]^2 + 2*x[2]^2 + 4*x[3]^2 - 48 <= 0)

  @NLobjective(
    nlp,
    Min,
    -x[1]*x[2]*x[3]
  )

  return nlp
end
