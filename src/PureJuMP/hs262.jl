# Hock and Schittkowski problem number 262.
#
#   Source:
#   Problem 262 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs262

"HS262 model"
function hs262(args...; kwargs...)
  nlp = Model()
  x0 = [1, 1, 1, 1]
  lvar = [0, 0, 0, 0]
  @variable(nlp, x[i = 1:4] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -0.5 * x[1] - x[2] - 0.5 * x[3] - x[4])

  @constraint(nlp, x[1] + x[2] + x[3] - 2 * x[4] - 6 == 0)
  @constraint(nlp, 10 - x[1] - x[2] - x[3] - x[4] >= 0)
  @constraint(nlp, 10 - 0.2 * x[1] - 0.5 * x[2] - x[3] - 2 * x[4] >= 0)
  @constraint(nlp, 10 - 2 * x[1] - x[2] - 0.5 * x[3] - 0.2 * x[4] >= 0)

  return nlp
end
