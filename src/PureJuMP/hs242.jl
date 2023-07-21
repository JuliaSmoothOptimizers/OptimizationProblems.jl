# Hock and Schittkowski problem number 242.
#
#   Source:
#   Problem 242 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs242

"HS242 model"
function hs242(args...; kwargs...)
  nlp = Model()
  x0 = [2.5, 10, 10]
  lvar = [0, 0, 0]
  uvar = [10, 10, 10]
  @variable(nlp, uvar[i] ≥ x[i = 1:3] ≥ lvar[i], start = x0[i])

  t = [ (10 + i) / 100 for i=1:10]
  @NLobjective(nlp, Min, sum( ((exp(-x[1] * t[i]) - exp(-x[2] * t[i])) - x[3] * (exp(-t[i]) - exp(-10 * t[i])))^2 for i=1:10))

  return nlp
end
