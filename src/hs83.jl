# Hock and Schittkowski problem number 83.
#
#   Source:
#   Problem 83 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs83

"HS83 model"
function hs83(args...)
  
  nlp  = Model()
  x0   = [ 78, 33, 27, 27, 27]
  lvar = [ 78, 33, 27, 27, 27]
  uvar = [102, 45, 45, 45, 45]
  @variable(nlp, lvar[i] <= x[i=1:5] <= uvar[i], start=x0[i])

  a = Array{Float64}(undef,12)
  a[1:6]  = [85.334407,0.0056858,0.0006262,0.0022053,80.51249,0.0071317]
  a[7:12] = [0.0029955,0.0021813,9.300961,0.0047026,0.0012547,0.0019085]
  
  @NLconstraint(nlp, 0 <= a[1] +  a[2]*x[2]*x[5] +  a[3]*x[1]*x[4] -  a[4]*x[3]*x[5] <= 92)
  @NLconstraint(nlp, 0 <= a[5] +  a[6]*x[2]*x[5] +  a[7]*x[1]*x[2] -  a[8]*x[3]*x[3] - 90 <= 20)
  @NLconstraint(nlp, 0 <= a[9] + a[10]*x[3]*x[5] + a[11]*x[1]*x[3] - a[12]*x[3]*x[4] - 20 <= 5)

  @NLobjective(
    nlp,
    Min,
    5.3578547*x[3]^2 + 0.8356891*x[1]*x[5] + 37.293239*x[1] - 40792.141
  )

  return nlp
end