# Given np electrons, find the equilibrium state distribution of minimal
# Columb potential of the electrons positioned on a conducting sphere

#   This is problem 2 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

export elec

function elec(args...; n::Int = default_nvar, kwargs...)
  n = max(2, div(n, 3))

  nlp = Model()

  range0 = [i / n for i = 1:n]

  θ0 = 2π .* range0
  ϕ0 = π .* range0
  xini = [sin(θ0[i]) * cos(ϕ0[i]) for i = 1:n] # x coordinate
  yini = [sin(θ0[i]) * sin(ϕ0[i]) for i = 1:n] # y coordinate 
  zini = [cos(θ0[i]) for i = 1:n]            # z coordinate
  x0 = [xini; yini; zini]

  @variable(nlp, x[i = 1:(3n)], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(
      sum(
        1 / sqrt((x[j] - x[i])^2 + (x[n + j] - x[n + i])^2 + (x[2n + j] - x[2n + i])^2) for
        j = (i + 1):n
      ) for i = 1:(n - 1)
    )
  )

  @constraint(nlp, [k = 1:n], x[k]^2 + x[n + k]^2 + x[2n + k]^2 == 1)

  return nlp
end
