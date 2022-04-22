# Find the polygon of maximal area, among polygons with nv sides and    
#   diameter d <= 1

#   This is problem 1 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

# The initial guess is inspired from https://vanderbei.princeton.edu/ampl/nlmodels/polygon/polygon2.mod

# See `polygon1`, `polygon2` and `polygon3` for similar variants.

export polygon

function polygon(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  N = div(n, 2)
  @variable(nlp, 0 <= r[1:N] <= 1, start = 1)
  @variable(nlp, 0 <= θ[i=1:N] <= π, start = i * π / (N - 1) - π / (N - 1))

  # impose an order to the angles
  @constraint(nlp, θ[N] == π)
  @constraint(nlp, r[N] == 0)
  for i = 1:(N - 1)
    @constraint(nlp, θ[i + 1] - θ[i] >= 0.0)
  end
  for i = 1:(N - 1)
    for j=(i + 1):N
      @NLconstraint(nlp, r[i]^2 + r[j]^2 - 2 * r[i] * r[j] * cos(θ[i] - θ[j]) - 1 <= 0)
    end
  end

  @NLobjective(
    nlp,
    Min,
    -0.5 * sum(r[i] * r[i + 1] * sin(θ[i + 1] - θ[i]) for i = 1:(N - 1))
  )
  return nlp
end
