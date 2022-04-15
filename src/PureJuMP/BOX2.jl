#   Box problem in 2 variables, obtained by fixing X3 = 1 in BOX2.

#   Source: Problem 11 in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.

#   classification SXR2-AN-3-0
export BOX2

function BOX2(args...; n::Int = default_nvar, m::Int = 10, kwargs...)
  m < 3 && @warn("BOX2: must have m ≥ 3")
  m = max(m, 3)

  nlp = Model()

  x0 = [0.0; 10.0; 1.0]
  @variable(nlp, x[i=1:3], start = x0[i])

  @NLobjective(
  nlp,
  Min,
  0.5*sum((exp(-0.1*j*x[1]) - exp(-0.1*j*x[2]) -x[3]*(exp(-0.1*j) - exp(-j)))^2 for j = 1:m))
  @constraint(nlp, x[3] == 1)

  return nlp
end