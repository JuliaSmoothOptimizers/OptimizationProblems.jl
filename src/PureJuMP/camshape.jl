# Maximize the area of the valve opening for one rotation of a convex cam 
# with constraints on the curvature and on the radius of the cam

#  This is problem 3 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#  classification LOR2-AN-V-V

export camshape

function camshape(args...; n::Int = default_nvar, kwargs...)
  R_min = 1
  R_max = 2
  R_v = 1
  α = 1.5
  θ = 2 * pi / (5 * (n + 1))

  nlp = Model()

  @variable(nlp, R_min <= x[i = 1:n] <= R_max, start = (R_min + R_max) / 2)

  @NLobjective(nlp, Min, -R_v * pi / n * sum(x[i] for i = 1:n))

  @NLconstraint(nlp, -α * θ <= R_max - x[n] <= α * θ)
  @NLconstraint(nlp, -α * θ <= x[1] - R_min <= α * θ)
  for i = 1:(n - 1)
    @NLconstraint(nlp, -α * θ <= x[i + 1] - x[i] <= α * θ)
  end
  @NLconstraint(nlp, -R_min * x[1] - x[1] * x[2] + 2 * R_min * x[2] * cos(θ) <= 0)
  @NLconstraint(nlp, -R_min^2 - R_min * x[1] + 2 * R_min * x[1] * cos(θ) <= 0)
  @NLconstraint(nlp, -x[n - 1] * x[n] - x[n] * R_max + 2 * x[n - 1] * R_max * cos(θ) <= 0)
  @NLconstraint(nlp, -2 * R_max * x[n] + 2 * x[n]^2 * cos(θ) <= 0)
  for i = 2:(n - 1)
    @NLconstraint(nlp, -x[i - 1] * x[i] - x[i] * x[i + 1] + 2 * x[i - 1] * x[i + 1] * cos(θ) <= 0)
  end

  return nlp
end
