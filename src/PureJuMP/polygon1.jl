# Find the polygon of maximal area, among polygons with nv sides and    
# diameter d <= 1

# JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
# Introduction to Optimization class.
# https://laurentlessard.com/teaching/524-intro-to-optimization/

# This implementation is similar to
# This is problem 1 in the COPS (Version 2) collection of 
# E. Dolan and J. More'
# see "Benchmarking Optimization Software with COPS"
# Argonne National Labs Technical Report ANL/MCS-246 (2000)

export polygon1

function polygon1(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  N = div(n, 2)
  @variable(nlp, 0 <= r[1:N] <= 1)
  @variable(nlp, 0 <= θ[1:N] <= 2π)

  # impose an order to the angles
  @constraint(nlp, θ[1] == 0)
  for i = 1:(N - 1)
    @constraint(nlp, θ[i + 1] - θ[i] >= 0.0)
  end

  @NLobjective(
    nlp,
    Min,
    -0.5 * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1)) -
    0.5 * r[1] * r[N] * sin(θ[1] - θ[N])
  )
  return nlp
end
