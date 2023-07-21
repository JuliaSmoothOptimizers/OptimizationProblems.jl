# Hock and Schittkowski problem number 250.
#
#   Source:
#   Problem 250 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs250

"HS250 model: Rosenbrock's post office problem"
function hs250(args...; kwargs...)
  nlp = Model()
  x0 = [10, 10, 10]
  lvar = [0, 0, 0]
  uvar = [20, 11, 42]
  @variable(nlp, uvar[i] ≥ x[i = 1:3] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, -x[1] * x[2] * x[3])
  @constraint(nlp, x[1] + 2 * x[2] + 2 * x[3] >= 0)
  @constraint(nlp, 72 - x[1] - 2 * x[2] - 2 * x[3] >= 0)

  return nlp
end
