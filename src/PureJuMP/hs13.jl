# Hock and Schittkowski problem number 13.
#
#   Source:
#   Problem 13 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs13

"HS13 model"
function hs13(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2] ≥ 0, start = -2)

  @objective(nlp, Min, 0.5 * (x[1] - 2)^2 + 0.5 * x[2]^2)

  @constraint(nlp, (1 - x[1])^3 ≥ x[2])

  return nlp
end
