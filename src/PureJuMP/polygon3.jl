# Find the polygon of maximal area, among polygons with nv sides and    
# diameter d <= 1
# Model 3: rectangular coordinates

# JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
# Introduction to Optimization class.
# https://laurentlessard.com/teaching/524-intro-to-optimization/

export polygon3

function polygon3(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  N = div(n, 2)
  @variable(nlp, x[1:N])
  @variable(nlp, y[1:N])

  for i = 1:N
    @NLconstraint(nlp, x[i]^2 + y[i]^2 - 1 <= 0)
  end

  # add ordering constraint to the vertices
  for i = 1:(N - 1)
    @NLconstraint(nlp, x[i] * y[i + 1] - y[i] * x[i + 1] >= 0)
  end
  @NLconstraint(nlp, x[N] * y[1] - y[N] * x[1] >= 0)

  @NLobjective(
    nlp,
    Min,
    -0.5 * sum(x[i] * y[i + 1] - y[i] * x[i + 1] for i = 1:(N - 1)) -
    0.5 * (x[N] * y[1] - y[N] * x[1])
  )
  return nlp
end
