# Hock and Schittkowski problem number 265.
#
#   Source:
#   Problem 265 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs265

"HS265 model"
function hs265(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0, 0, 0]
  lvar = [0, 0, 0, 0]
  uvar = [1, 1, 1, 1]
  @variable(nlp, uvar[i] ≥ x[i = 1:4] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, sum(1 - exp(-10 * x[i] * exp(-x[i + 2])) for i = 1:2))
  @constraint(nlp, x[1] + x[2] - 1 == 0)
  @constraint(nlp, x[3] + x[4] - 1 == 0)

  return nlp
end
