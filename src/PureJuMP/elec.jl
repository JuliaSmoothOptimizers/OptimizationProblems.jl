# Given np electrons, find the equilibrium state distribution of minimal
# Columb potential of the electrons positioned on a conducting sphere

#   This is problem 2 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

export elec

function elec(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  m = max(2, div(n_orig, 3))
  n = 3 * m
  @adjust_nvar_warn("elec", n_orig, n)

  nlp = Model()

  range0 = [i / m for i = 1:m]

  θ0 = 2π .* range0
  ϕ0 = π .* range0
  xini = [sin(θ0[i]) * cos(ϕ0[i]) for i = 1:m] # x coordinate
  yini = [sin(θ0[i]) * sin(ϕ0[i]) for i = 1:m] # y coordinate 
  zini = [cos(θ0[i]) for i = 1:m]            # z coordinate
  x0 = [xini; yini; zini]

  @variable(nlp, x[i = 1:(3m)], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(
      sum(
        1 / sqrt((x[j] - x[i])^2 + (x[m + j] - x[m + i])^2 + (x[2m + j] - x[2m + i])^2) for
        j = (i + 1):m
      ) for i = 1:(m - 1)
    )
  )

  @constraint(nlp, [k = 1:m], x[k]^2 + x[m + k]^2 + x[2m + k]^2 == 1)

  return nlp
end
