# Hock and Schittkowski problem number 223.
#
#   Source:
#   Problem 223 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs223

"HS223 model"
function hs223(args...; kwargs...)
  nlp = Model()
  x0 = [0.1, 3.3]
  lvar = [0, 0]
  uvar = [10, 10]
  @variable(nlp, uvar[i] ≥ x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -x[1])
  @constraint(nlp, exp(exp(x[1])) >= 0)
  @constraint(nlp, x[2] - exp(exp(x[1])) >= 0)

  return nlp
end
