# Hock and Schittkowski problem number 21.
#
#   Source:
#   Problem 21 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-2-1
#
# A. Montoison, Montreal, 04/2018.

export hs21

"HS21 model"
function hs21(args...)
  
  nlp  = Model()
  lvar = [  2,-50]
  uvar = [ 50, 50]
  @variable(nlp, lvar[i] <= x[i=1:2] <= uvar[i], start = -1)

  @constraint(nlp, 10*x[1] - x[2] - 10 >= 0)

  @NLobjective(
    nlp,
    Min,
    0.01*x[1]^2 + x[2]^2 - 100
  )

  return nlp
end
