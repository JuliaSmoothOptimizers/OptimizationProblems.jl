# Hock and Schittkowski problem number 103.
#
#   Source:
#   Problem 103 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification PPR-AN-7-6
#
# A. Montoison, Montreal, 05/2018.

export hs103

"HS103 model"
function hs103(args...)
  
  nlp  = Model()
  a    = 0.5
  lvar = [0.1*ones(6); 0.01]
  @variable(nlp, lvar[i] <= x[i=1:7] <= 10, start = 6)
  
  exposant_f = Array{Float64}(undef,4,7)
  exposant_f[1,:] = [ 1,-1, 0, 2, 0  ,-3,   a]
  exposant_f[2,:] = [-1,-2, 1, 1,-1  , 0,-0.5] 
  exposant_f[3,:] = [-2, 1, 0,-1,-2  , 1,   0] 
  exposant_f[4,:] = [ 2, 2,-1, 0, 0.5,-2,   1]  

  @NLexpression(nlp, f, 10*prod(x[i]^exposant_f[1,i] for i=1:7)
                      + 15*prod(x[i]^exposant_f[2,i] for i=1:7)
                      + 20*prod(x[i]^exposant_f[3,i] for i=1:7)
                      + 25*prod(x[i]^exposant_f[4,i] for i=1:7)
  )

  exposant_c1 = Array{Float64}(undef,3,7)
  exposant_c1[1,:] = [0.5,0, -1,   0, 0,-2  ,  1]
  exposant_c1[2,:] = [3,  1, -2,   0, 0, 1  ,0.5] 
  exposant_c1[3,:] = [0, -1,  1,-0.5, 0, 2/3,1/4] 
  @NLconstraint(nlp, 1 - 0.5*prod(x[i]^exposant_c1[1,i] for i=1:7)
                       - 0.7*prod(x[i]^exposant_c1[2,i] for i=1:7)
                       - 0.2*prod(x[i]^exposant_c1[3,i] for i=1:7) >= 0)

  exposant_c2 = Array{Float64}(undef,3,7)
  exposant_c2[1,:] = [-0.5, 1  , -1,  0, -1, 1 , 0]
  exposant_c2[2,:] = [0   , 0  ,  1, -1, -1,  2, 0] 
  exposant_c2[3,:] = [-1  , 0.5,  0, -2, -1,1/3, 0] 
  @NLconstraint(nlp, 1 - 1.3*prod(x[i]^exposant_c2[1,i] for i=1:7)
                       - 0.8*prod(x[i]^exposant_c2[2,i] for i=1:7)
                       - 3.1*prod(x[i]^exposant_c2[3,i] for i=1:7) >= 0)

  exposant_c3 = Array{Float64}(undef,4,7)
  exposant_c3[1,:] = [1 , 0, -1.5, 0, 1, -1,  1/3]
  exposant_c3[2,:] = [0 , 1, -0.5, 0, 1, -1, -0.5]
  exposant_c3[3,:] = [-1, 1,  0.5, 0, 1,  0,    0]
  exposant_c3[4,:] = [0 ,-2,    1, 0, 1, -1,    1]
  @NLconstraint(nlp, 1 -   2*prod(x[i]^exposant_c3[1,i] for i=1:7)
                       - 0.1*prod(x[i]^exposant_c3[2,i] for i=1:7)
                       -   1*prod(x[i]^exposant_c3[3,i] for i=1:7)
                       -0.65*prod(x[i]^exposant_c3[4,i] for i=1:7) >= 0)

  exposant_c4 = Array{Float64}(undef,4,7)
  exposant_c4[1,:] = [-2 ,  1,  0, -1 , 0.5 , 0, 1/3]
  exposant_c4[1,:] = [0.5,  2,  1, 1/3, -2/3, 0, 1/4]
  exposant_c4[1,:] = [-3 , -2,  1, 0  , 1   , 0, 3/4]
  exposant_c4[1,:] = [0  ,  0, -2, 1  , 0   , 0, 0.5]
  @NLconstraint(nlp, 1 - 0.2*prod(x[i]^exposant_c4[1,i] for i=1:7)
                       - 0.3*prod(x[i]^exposant_c4[2,i] for i=1:7)
                       - 0.4*prod(x[i]^exposant_c4[3,i] for i=1:7)
                       - 0.5*prod(x[i]^exposant_c4[4,i] for i=1:7) >= 0)

  @NLconstraint(nlp, 100 <= f <= 3000)

  @NLobjective(
    nlp,
    Min,
    f
  )

  return nlp
end