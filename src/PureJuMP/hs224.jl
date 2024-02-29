# Hock and Schittkowski problem number 224.
#
#   Source:
#   Problem 224 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs224

"HS224 model"
function hs224(args...; kwargs...)
  nlp = Model()
  x0 = [0.1, 0.1]
  lvar = [0, 0]
  uvar = [6, 6]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, 2 * x[1]^2 + x[2]^2 - 48 * x[1] - 40 * x[2])
  @constraint(nlp, x[1] + 3 * x[2] >= 0)
  @constraint(nlp, 18 - x[1] - 3 * x[2] >= 0)
  @constraint(nlp, x[1] + x[2] >= 0)
  @constraint(nlp, 8 - x[1] - x[2] >= 0)
  return nlp
end
