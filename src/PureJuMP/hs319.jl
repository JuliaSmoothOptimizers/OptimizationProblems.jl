# Schittkowski problem number 319.
#
#   Source:
#   Problem 319 in
#   Schittkowski, K. (1987). 
#   More Test Examples for Nonlinear Programming Codes. 
#   Lecture Notes in Economics and Mathematical Systems.
#   doi:10.1007/978-3-642-61582-5
#   
#   classification QQR2-AN-2-1
#
export hs319

"HS319 model"
function hs319(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2] , start = 0)

  @NLconstraint(nlp,x[1]^2/100+x[2]^2/16-1==0)
  @NLobjective(nlp,Min,(x[1]-20)^2+(x[2]+20)^2)

  return nlp
end