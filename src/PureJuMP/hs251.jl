# Hock and Schittkowski problem number 251.
#
#   Source:
#   Problem 251 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs251

"HS251 model"
function hs251(args...; kwargs...)
  nlp = Model()
  x0 = [10, 10, 10]
  lvar = [0, 0, 0]
  uvar = [42, 42, 42]
  @variable(nlp, uvar[i] ≥ x[i = 1:3] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -x[1] * x[2] * x[3])
  @constraint(nlp, 72 - x[1] - 2 * x[2] - 2 * x[3] >= 0)

  return nlp
end
