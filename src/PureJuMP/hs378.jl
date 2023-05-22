# Schittkowski problem number 378.
#
#   Source:
#   Problem 378 in
#   Schittkowski, K. (1987). 
#   More Test Examples for Nonlinear Programming Codes. 
#   Lecture Notes in Economics and Mathematical Systems.
#   doi:10.1007/978-3-642-61582-5
#   
#   classification OOR2-AN-10-3
#
export hs378

"HS378 model"
function hs378(args...; kwargs...)
  nlp = Model()

  A = [-6.089, -17.164, - 34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]

  @variable(nlp, x[i = 1:10] , start = -2.3)

  @NLconstraint(nlp,exp(x[1])+2*exp(x[2])+2*exp(x[3])+exp(x[6])+exp(x[10])-2==0)
  @NLconstraint(nlp,exp(x[4])+2*exp(x[5])+exp(x[6])+exp(x[7])-1==0)
  @NLconstraint(nlp,exp(x[3])+exp(x[7])+exp(x[8])+2*exp(x[9])+exp(x[10])-1==0)

  @NLobjective(nlp,Min,sum(exp(x[i])*(A[i]+x[i]-log(sum(exp(x[j]) for j = 1:10))) for i = 1:10))

  return nlp
end