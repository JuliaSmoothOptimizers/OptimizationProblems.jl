# Hock and Schittkowski problem number 110.
#
#   Source:
#   Problem 110 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification GBR-AN-10-0
#
# A. Montoison, Montreal, 05/2018.

export hs110

"HS110 model"
function hs110(args...)
  
  nlp  = Model()
  @variable(nlp, 2.001 <= x[i=1:10] <= 9.999, start = 9)
  
  @NLobjective(
    nlp,
    Min,
    sum(log(x[i] - 2)^2 + log(10 - x[i])^2 for i=1:10) - prod(x[i] for i=1:10)^0.2
  )

  return nlp
end