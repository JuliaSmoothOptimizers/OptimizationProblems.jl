# Schittkowski problem number 219.
#
#   Source:
#   Problem 219 in
#   Schittkowski, K. (1987). 
#   More Test Examples for Nonlinear Programming Codes. 
#   Lecture Notes in Economics and Mathematical Systems.
#   doi:10.1007/978-3-642-61582-5
#   
#   classification LPR-T1-1
#
# Solution is: (1, 1, 0, 0) with f(x^*) = -1

export hs219

"A short docstring on the problem"
function hs219(; n::Int = default_nvar, kwargs...)
  nlp = Model()
  x0 = [10, 10, 10, 10]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @constraint(nlp, x[1]^2 - x[2] - x[4]^2 == 0)
  @NLconstraint(nlp, x[2] - x[1]^3 - x[3]^2 == 0)

  @NLobjective(
    nlp,
    Min,
    -x[1]
  )
  return nlp
end
