# Hock and Schittkowski problem number 245.
#
#   Source:
#   Problem 245 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs245

"HS245 model"
function hs245(args...; kwargs...)
  nlp = Model()
  x0 = [0, 10, 20]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    sum(
      (exp(-x[1] * i / 10) - exp(-x[2] * i / 10) - x[3] * (exp(-i / 10) - exp(-i)))^2 for i = 1:10
    )
  )

  return nlp
end
