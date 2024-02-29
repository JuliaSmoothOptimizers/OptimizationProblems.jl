# Hock and Schittkowski problem number 39.
#
#   Source:
#   Problem 39 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification LOR2-AN-4-2
#
# D. Cabral, Curitiba, 10/2016.

export hs39

"HS39 model"
function hs39(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:4], start = 2)

  @objective(nlp, Min, -x[1])

  @constraint(nlp, x[2] - x[1]^3 - x[3]^2 == 0)

  @constraint(nlp, x[1]^2 - x[2] - x[4]^2 == 0)

  return nlp
end
