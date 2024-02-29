# Hock and Schittkowski problem number 226.
#
#   Source:
#   Problem 226 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs226

"HS226 model"
function hs226(args...; kwargs...)
  nlp = Model()
  x0 = [0.8, 0.05]
  lvar = [0, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -x[1] * x[2])
  @constraint(nlp, x[1]^2 + x[2]^2 >= 0)
  @constraint(nlp, 1 - x[1]^2 - x[2]^2 >= 0)

  return nlp
end
