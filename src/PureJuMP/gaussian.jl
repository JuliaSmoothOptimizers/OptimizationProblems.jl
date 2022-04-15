#   Source: Problem 9 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#28

#   classification SUR2-AN-3-0
export gaussian

function gaussian(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  x0 = [.4, 1, 0]
  @variable(nlp, x[i=1:3], start=x0[i])

  y = [.0009, .0044, .0175, .054, .1295, .242, .3521, .3989, .3521, .242, .1295, .054, .0175, .0044, .0009]

  @NLobjective(nlp, Min, (x[1]*exp(-x[2]/2*((8-1)/2-x[3])^2)-y[1])^2 + (x[1]*exp(-x[2]/2*((8-2)/2-x[3])^2)-y[2])^2
      + (x[1]*exp(-x[2]/2*((8-3)/2-x[3])^2)-y[3])^2 + (x[1]*exp(-x[2]/2*((8-4)/2-x[3])^2)-y[4])^2
      + (x[1]*exp(-x[2]/2*((8-5)/2-x[3])^2)-y[5])^2+ (x[1]*exp(-x[2]/2*((8-6)/2-x[3])^2)-y[6])^2
      + (x[1]*exp(-x[2]/2*((8-7)/2-x[3])^2)-y[7])^2+ (x[1]*exp(-x[2]/2*((8-8)/2-x[3])^2)-y[8])^2
      + (x[1]*exp(-x[2]/2*((8-9)/2-x[3])^2)-y[9])^2+ (x[1]*exp(-x[2]/2*((8-10)/2-x[3])^2)-y[10])^2
      + (x[1]*exp(-x[2]/2*((8-11)/2-x[3])^2)-y[11])^2+ (x[1]*exp(-x[2]/2*((8-12)/2-x[3])^2)-y[12])^2
      + (x[1]*exp(-x[2]/2*((8-13)/2-x[3])^2)-y[13])^2+ (x[1]*exp(-x[2]/2*((8-14)/2-x[3])^2)-y[14])^2
      + (x[1]*exp(-x[2]/2*((8-15)/2-x[3])^2)-y[15])^2  )
  return nlp
end
