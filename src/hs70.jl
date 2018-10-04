# Hock and Schittkowski problem number 70.
#
#   Source:
#   Problem 70 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-4-1
#
# A. Montoison, Montreal, 05/2018.

export hs70

"HS70 model"
function hs70(args...)

  nlp  = Model()
  x0   = [2, 4, 0.04, 2]
  uvar = [100, 100, 1, 100]
  @variable(nlp, 0.00001 <= x[i=1:4] <= uvar[i], start = x0[i])

  c = Array{Float64}(undef,19)
  c[1] = 0.1
  for i=2:19
    c[i] = i-1
  end

  yobs = Array{Float64}(undef,19)
  yobs[1:10]  = [.00189,.1038,.268,.506,.577,.604,.725,.898,.947,.845]
  yobs[11:19] = [.702,.528,.385,.257,.159,.0869,.0453,.01509,.00189]

  @NLexpression(nlp, b, x[3] + (1-x[3])*x[4])
  @NLexpression(nlp, ycal[i=1:19], (1 + 1/(12*x[2]))*(x[3]*b^x[2])*((x[2]/6.2832)^(0.5))
    *(c[i]/7.685)^(x[2] - 1)*exp(x[2] - b*c[i]*x[2]/7.658)
    + (1 + (1/(12*x[1])))*(1 - x[3])*(b/x[4])^x[1]*(x[1]/6.2832)^0.5
    * (c[i]/7.658)^(x[1]-1)*exp(x[1] - b*c[i]*x[1]/(7.658*x[4]))  
  )

  @NLconstraint(nlp, x[3] + (1-x[3])*x[4] >= 0)

  @NLobjective(
    nlp,
    Min,
    sum((ycal[i] - yobs[i])^2 for i=1:19)
  )

  return nlp
end