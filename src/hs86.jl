# Hock and Schittkowski problem number 86.
#
#   Source:
#   Problem 86 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR-AN-5-10
#
# A. Montoison, Montreal, 05/2018.

export hs86

"HS86 model"
function hs86(args...)

  nlp  = Model()
  x0   = [0, 0, 0, 0, 1]
  @variable(nlp, x[i=1:5] >= 0, start = x0[i])

  a = Array{Float64}(undef,10,5)
  a[1,:]  = [-16 , 2, 0, 1,    0]
  a[2,:]  = [ 0  ,-2, 0, 4,    2]
  a[3,:]  = [-3.5, 0, 2, 0,    0]
  a[4,:]  = [ 0  ,-2, 0,-4,   -1]
  a[5,:]  = [ 0  ,-9,-2, 1, -2.8]
  a[6,:]  = [ 2  , 0,-4, 0,    0]
  a[7,:]  = [-1  ,-1,-1,-1,   -1]
  a[8,:]  = [-1  ,-2,-3,-2,   -1]
  a[9,:]  = [ 1  , 2, 3, 4,    5]
  a[10,:] = [ 1  , 1, 1, 1,    1]

  b = [-40, -2, -0.25, -4, -4, -1, -40, -60, 5, 1]

  c = Array{Float64}(undef,5,5)
  c[1,:] = [30 , -20, -10, 32,-10]
  c[2,:] = [-20,  39, -6 ,-31, 32]
  c[3,:] = [-10, -6 ,  10,-6 ,-10]
  c[4,:] = [32 , -31, -6 , 39,-20]
  c[5,:] = [-10,  32, -10,-20, 30]

  d = [ 4 , 8 , 10, 6 , 2]

  e = [-15, -27, -36, -18, -12]

  for i = 1:10
    @constraint(nlp, sum(a[i,j]*x[j] for j=1:5) - b[i] >= 0)
  end

  @NLobjective(
    nlp,
    Min,
    sum(e[j]*x[j] for j=1:5) + sum(sum(c[i,j]*x[i]*x[j] for j=1:5) for i=1:5) + sum(d[j]*x[j]^3 for j=1:5) 
  )

  return nlp
end