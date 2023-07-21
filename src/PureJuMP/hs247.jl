# Hock and Schittkowski problem number 247.
#
#   Source:
#   Problem 247 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs247

"HS247 model: Helical valley in x3 direction"
function hs247(args...; kwargs...)
  nlp = Model()
  x0 = [-1, 0, 0]
  lvar = [0.1, -Inf, -2.5]
  uvar = [Inf, Inf, 7.5]
  @variable(nlp, uvar[i] ≥ x[i = 1:3] ≥ lvar[i], start = x0[i])

  v(x1, x2) = ifelse(x1 > 0, 1 / (2 * pi) * atan(x2 / x1), 1/2 + 1 / (2 * pi) * atan(x2 / x1))
  register(model, :v, 2, v; autodiff = true)
  @NLobjective(nlp, Min, 100 * (x[3] - 10 * v(x[1], x[2]))^2 + (sqrt(x[1]^2 + x[2]^2) - 1)^2 + x[3]^2)

  return nlp
end
