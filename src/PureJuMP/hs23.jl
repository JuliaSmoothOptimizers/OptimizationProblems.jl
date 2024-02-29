# Hock and Schittkowski problem number 23.
#
#   Source:
#   Problem 23 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-5
#
# A. Montoison, Montreal, 04/2018.

export hs23

"HS23 model"
function hs23(args...; kwargs...)
  nlp = Model()
  x0 = [3, 1]
  @variable(nlp, -50 ≤ x[i = 1:2] ≤ 50, start = x0[i])

  @constraint(nlp, x[1] + x[2] - 1 ≥ 0)
  @constraint(nlp, x[1]^2 + x[2]^2 - 1 ≥ 0)
  @constraint(nlp, 9 * x[1]^2 + x[2]^2 - 9 ≥ 0)
  @constraint(nlp, x[1]^2 - x[2] ≥ 0)
  @constraint(nlp, x[2]^2 - x[1] ≥ 0)

  @objective(nlp, Min, 0.5 * x[1]^2 + 0.5 * x[2]^2)

  return nlp
end
