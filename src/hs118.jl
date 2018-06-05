# Hock and Schittkowski problem number 118.
#
#   Source:
#   Problem 118 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification QLR-AN-15-17
#
# A. Montoison, Montreal, 05/2018.

export hs118

"HS118 model"
function hs118(args...)
  
  nlp  = Model()
  x0   = [20, 55, 15, 20,  60, 20, 20,  60, 20, 20,  60, 20, 20,  60, 20]
  lvar = [ 8, 43,  3,  0,   0,  0,  0,   0,  0,  0,   0,  0,  0,   0,  0]
  uvar = [21, 57, 16, 90, 120, 60, 90, 120, 60, 90, 120, 60, 90, 120, 60]
  @variable(nlp, lvar[i] <= x[i=1:15] <= uvar[i], start=x0[i])
  
  a = 50.176
  b = sin(0.25)
  c = cos(0.25)

  for j = 1:4
    @constraint(nlp, 0 <= x[3*j+1] - x[3*j-2] + 7 <= 13)
    @constraint(nlp, 0 <= x[3*j+2] - x[3*j-1] + 7 <= 13)
    @constraint(nlp, 0 <= x[3*j+3] - x[3*j]   + 7 <= 14)
  end
  @constraint(nlp, x[1]  + x[2]  + x[3]  - 60  >= 0)
  @constraint(nlp, x[4]  + x[5]  + x[6]  - 70  >= 0)
  @constraint(nlp, x[7]  + x[8]  + x[9]  - 100 >= 0)
  @constraint(nlp, x[10] + x[11] + x[12] - 50  >= 0)
  @constraint(nlp, x[13] + x[14] + x[15] - 85  >= 0)

  @NLobjective(
    nlp,
    Min,
    sum(2.3*x[3*k+1] + 0.0001*x[3*k+1]^2 + 1.7*x[3*k+2] + 0.0001*x[3*k+2]^2 + 2.2*x[3*k+3] + 0.00015*x[3*k+3]^2 for k=0:4)
  )

  return nlp
end