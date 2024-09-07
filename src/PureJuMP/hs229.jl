# Hock and Schittkowski problem number 229.
#
#   Source:
#   Problem 229 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs229

"HS229 model"
function hs229(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2, 1]
  lvar = [-2, -2]
  uvar = [2, 2]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  return nlp
end
