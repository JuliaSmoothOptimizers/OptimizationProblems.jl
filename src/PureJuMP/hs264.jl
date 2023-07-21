# Hock and Schittkowski problem number 264.
#
#   Source:
#   Problem 264 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs264

"HS264 model: modified Rosen-Suzuki problem"
function hs264(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0, 0, 0]

  @variable(nlp, x[i = 1:4], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    x[1]^2 + x[2]^2 + 2 * x[3]^2 + x[4]^2 - 5 * x[1] - 5 * x[2] - 21 * x[3] + 7 * x[4]
  )
  @NLconstraint(nlp, -x[1]^2 - x[2]^2 - x[3]^2 - x[4]^2 - x[1] + x[2] + x[3] + x[4] + 8 >= 0)
  @NLconstraint(nlp, -x[1]^2 - 2 * x[2]^2 - x[3]^2 - 2 * x[4]^2 + x[1] + x[4] + 9 >= 0)
  @NLconstraint(nlp, -2 * x[1]^2 - x[2]^2 - x[3]^2 - 2 * x[1] + x[2] + x[4] + 5 >= 0)
  return nlp
end
