# Hock and Schittkowski problem number 253.
#
#   Source:
#   Problem 253 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs253

"HS253 model"
function hs253(args...; kwargs...)
  nlp = Model()
  x0 = [0, 2, 0]
  lvar = [0, 0, 0]
  @variable(nlp, x[i = 1:3] ≥ lvar[i], start = x0[i])

  c = ones(8)
  a1 = [0; 10; 10; 0; 0; 10; 10; 0]
  a2 = [0; 0; 10; 10; 0; 0; 10; 10]
  a3 = [0; 0; 0; 0; 10; 10; 10; 10]

  @NLobjective(nlp, Min, sum(c[j] * sqrt((a1[j] - x[1]^2 + (a2[j] - x[2])^2 + (a3[j] - x[3])^2)) for j=1:8))
  @constraint(nlp, 30 - 3 * x[1] - 3 * x[3] >= 0)

  return nlp
end
