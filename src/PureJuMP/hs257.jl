# Hock and Schittkowski problem number 257.
#
#   Source:
#   Problem 257 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs257

"HS257 model"
function hs257(args...; kwargs...)
  nlp = Model()
  x0 = [-3, -1, -3, -1]
  lvar = [0, -Inf, 0, -Inf]
  @variable(nlp, x[i = 1:4] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 + 90 * (x[3]^2 - x[4])^2 + (x[3] - 1)^2 + 10.1 * (x[2] - 1)^2 + 10.1 * (x[4] - 1)^2 + 19.8 * (x[1] - 1) * (x[4] - 1))

  return nlp
end
