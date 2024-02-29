# Hock and Schittkowski problem number 22.
#
#   Source:
#   Problem 22 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-2
#
# A. Montoison, Montreal, 04/2018.

export hs22

"HS22 model"
function hs22(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 2)

  @constraint(nlp, x[1] + x[2] - 2 ≤ 0)
  @constraint(nlp, -x[1]^2 + x[2] ≥ 0)

  @objective(nlp, Min, 0.5 * (x[1] - 2)^2 + 0.5 * (x[2] - 1)^2)

  return nlp
end
