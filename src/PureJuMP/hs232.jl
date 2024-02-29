# Hock and Schittkowski problem number 232.
#
#   Source:
#   Problem 232 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs232

"HS232 model"
function hs232(args...; kwargs...)
  nlp = Model()
  x0 = [2, 0.5]
  lvar = [0, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -(9 - (x[1] - 3)^2) * x[2]^3 / (27 * sqrt(3)))
  @constraint(nlp, x[1] / sqrt(3) - x[2] >= 0)
  @constraint(nlp, x[1] + sqrt(3) * x[2] >= 0)
  @constraint(nlp, 6 - x[1] - sqrt(3) * x[2] >= 0)
  return nlp
end
