# Hock and Schittkowski problem number 67.
#
#   Source:
#   Problem 67 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGI2-AN-3-14
#
# A. Montoison, Montreal, 05/2018.

export hs67

function fy(x1,x2,x3)
  y = Array{Float64}(8)
  y[1] = 0
  y[2] = 1.6*x1
  y[3] = 1.22*y[2] - x1
  y[6] = (x2 + y[3])/x1
  y2c  = 0.01*x1*(112 + 13.167*y[6] - 0.6667*y[6]^2)
  while abs(y2c - y[2]) > 0.001
    y[2] = y2c
    y[3] = 1.22*y[2] - x1
    y[6] = (x2 + y[3])/x1
    y2c  = 0.01*x1*(112 + 13.167*y[6] - 0.6667*y[6]^2)
  end
  y[4] = 93
  y[5] = 86.35 + 1.098*y[6] - 0.038*y[6]^2 + 0.325*(y[4] - 89)
  y[8] = 3*y[5] - 133
  y[7] = 35.82 - 0.222*y[8]
  y4c  = 98000*x3/(y[2]*y[7] + 1000*x3)
  while abs(y4c - y[4]) > 0.001
    y[4] = y4c
    y[5] = 86.35 + 1.098*y[6] - 0.038*y[6]^2 + 0.325*(y[4] - 89)
    y[8] = 3*y[5] - 133
    y[7] = 35.82 - 0.222*y[8]
    y4c  = 98000*x3/(y[2]*y[7] + 1000*x3)
  end
  return y
end

"HS67 model"
function hs67(args...)
  nlp = Model()

  x0 = [1745,12000,110]
  @variable(nlp, x[i=1:3], start=x0[i])

  a = [0,0,85,90,3,0.01,145,5000,2000,93,95,12,4,162]
  
  JuMP.register(nlp, :fy, 3, fy, autodiff=true)
  @NLexpression(nlp, y[i=1:8], fy(x[1],x[2],x[3]))  

  for i=1:7
    @NLconstraint(nlp, y[i+1] - a[i] >= 0)
  end
  for i=8:14
    @NLconstraint(nlp, a[i] - y[i-6] >= 0)
  end

  @constraint(nlp, 1.e-5 <= x[1] <= 2.e3)
  @constraint(nlp, 1.e-5 <= x[2] <= 1.6e4)
  @constraint(nlp, 1.e-5 <= x[3] <= 1.2e2)

  @NLobjective(
    nlp,
    Min,
    -(0.063*y[2]*y[5] - 5.04*x[1] - 3.36*y[3] - 0.035*x[2] - 10*x[3])
    )

  return nlp
end







