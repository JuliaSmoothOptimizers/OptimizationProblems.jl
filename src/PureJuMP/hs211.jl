# Hock and Schittkowski problem number 211.
#
#   Source:
#   Problem 211 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
export hs211

"HS211 model"
function hs211(; n::Int = default_nvar, kwargs...)
  nlp = Model()
  @variable(f_211, x1, start = -1.2)
  @variable(f_211, x2, start = 1)

  @objective(f_211, Min, 100*(x2 - x1^3)^2 + (1 - x1)^2)
  return nlp
end
