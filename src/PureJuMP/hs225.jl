# Hock and Schittkowski problem number 225.
#
#   Source:
#   Problem 225 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs225

"HS225 model"
function hs225(args...; kwargs...)
  nlp = Model()
  x0 = [3, 1]

  @variable(nlp, x[i = 1:2], start = x0[i])

  @NLobjective(nlp, Min, x[1]^2 + x[2]^2)
  @constraint(nlp, x[1] + x[2] - 1 >= 0)
  @NLconstraint(nlp, x[1]^2 + x[2]^2 - 1 >= 0)
  @NLconstraint(nlp, 9 * x[1]^2 + x[2]^2 - 9 >= 0)
  @NLconstraint(nlp, x[1]^2 - x[2] >= 0)
  @NLconstraint(nlp, x[2]^2 - x[1] >= 0)

  return nlp
end
