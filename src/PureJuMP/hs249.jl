# Hock and Schittkowski problem number 249.
#
#   Source:
#   Problem 249 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs249

"HS249 model"
function hs249(args...; kwargs...)
  nlp = Model()
  x0 = [1, 1, 1]
  lvar = [1, -Inf, -Inf]
  @variable(nlp, x[i = 1:3] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, x[1]^2 + x[2]^2 + x[3]^2)
  @NLconstraint(nlp, x[1]^2 + x[2]^2 - 1 >= 0)

  return nlp
end
