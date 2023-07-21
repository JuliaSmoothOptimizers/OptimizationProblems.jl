# Hock and Schittkowski problem number 235.
#
#   Source:
#   Problem 235 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs235

"HS235 model"
function hs235(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 3, 1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @NLobjective(nlp, Min, 0.01 * (x[1] - 1)^2 + (x[2] - x[1]^2)^2)
  @NLconstraint(nlp, x[1] + x[3]^2 + 1 == 0)
  return nlp
end
