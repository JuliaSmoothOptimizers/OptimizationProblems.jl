# Hock and Schittkowski problem number 84.
#
#   Source:
#   Problem 84 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR-AN-5-3
#
# A. Montoison, Montreal, 05/2018.

export hs84

"HS84 model"
function hs84(args...)
    
  nlp  = Model()
  x0   = [2.52,   2, 37.5, 9.25, 6.8]
  lvar = [   0, 1.2,   20,    9, 6.5]
  uvar = [1000, 2.4,   60,  9.3,   7]
  @variable(nlp, lvar[i] <= x[i=1:5] <= uvar[i], start=x0[i])


  a = Array{Float64}(undef,21)
  a[1:7]   = [-24345,-8720288.849,150512.5253,-156.6950325,476470.3222,729482.8271,-145421.402]
  a[8:14]  = [2931.1506,-40.427932,5106.192,15711.36,-155011.1084,4360.53352,12.9492344]
  a[15:21] = [10236.884,13176.786,-326669.5104,7390.68412,-27.8986976,16643.076,30988.146]
  
  @NLconstraint(nlp, 0 <=  a[7]*x[1] +  a[8]*x[1]*x[2] +  a[9]*x[1]*x[3] + a[10]*x[1]*x[4] + a[11]*x[1]*x[5] <= 294000)
  @NLconstraint(nlp, 0 <= a[12]*x[1] + a[13]*x[1]*x[2] + a[14]*x[1]*x[3] + a[15]*x[1]*x[4] + a[16]*x[1]*x[5] <= 294000)
  @NLconstraint(nlp, 0 <= a[17]*x[1] + a[18]*x[1]*x[2] + a[19]*x[1]*x[3] + a[20]*x[1]*x[4] + a[21]*x[1]*x[5] <= 277200)

  @NLobjective(
    nlp,
    Min,
    -a[1] - a[2]*x[1] - a[3]*x[1]*x[2] - a[4]*x[1]*x[3] - a[5]*x[1]*x[4] - a[6]*x[1]*x[5]
  )

  return nlp
end