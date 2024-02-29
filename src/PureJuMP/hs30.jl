# Hock and Schittkowski problem number 30.
#
#   Source:
#   Problem 30 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-1
#
# A. Montoison, Montreal, 04/2018.

export hs30

"HS30 model"
function hs30(args...; kwargs...)
  nlp = Model()
  lvar = [1, -10, -10]
  uvar = [10, 10, 10]
  @variable(nlp, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = 1)

  @constraint(nlp, x[1]^2 + x[2]^2 - 1 ≥ 0)

  @objective(nlp, Min, 0.5 * sum(x[i]^2 for i = 1:3))

  return nlp
end
