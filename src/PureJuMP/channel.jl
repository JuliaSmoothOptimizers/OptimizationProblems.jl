# Flow in a Channel

# Analyze the flow of a fluid during injection into a long vertical channel

#   This is problem 7 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

export channel

function channel(args...; n::Int = default_nvar, kwargs...)
  nh = max(2, div(n, 8))

  nc = 4
  nd = 4
  R = 10
  tf = 1.0
  h = tf / nh
  ρ = [0.06943184420297, 0.33000947820757, 0.66999052179243, 0.93056815579703]
  bc = [
    0 1
    0 0
  ]
  t = [(i - 1) * h for i = 1:(nh + 1)]
  fact = [j == 0 ? 1 : prod(1:j) for j = 0:(nc + nd)]

  nlp = Model()

  x0 = zeros(4 * nh + nc * nh)
  for i = 1:nh
    x0[i] = t[i]^2 * (3 - 2 * t[i])
    x0[nh + i] = 6 * t[i] * (1 - t[i])
    x0[2 * nh + i] = 6 * (1 - 2 * t[i])
    x0[3 * nh + i] = -12
  end

  @variable(nlp, v[i = 1:nh, j = 1:nd], start = x0[i + (j - 1) * nh])
  @variable(nlp, w[i = 1:nh, j = 1:nc], start = 0.0)

  @objective(nlp, Min, 1.0)

  @constraint(nlp, v[1, 1] == bc[1, 1])
  @constraint(nlp, v[1, 2] == bc[2, 1])
  @constraint(
    nlp,
    sum(v[nh, k] * h^(k - 1) / prod(j for j = 1:(k - 1)) for k = 1:nd) +
    h^nd * sum(w[nh, k] / prod(j for j = 1:(k + nd - 1)) for k = 1:nc) == bc[1, 2]
  )
  @constraint(
    nlp,
    sum(v[nh, k] * h^(k - 2) / prod(j for j = 1:(k - 2)) for k = 2:nd) +
    h^(nd - 1) * sum(w[nh, k] / prod(j for j = 1:(k + nd - 2)) for k = 1:nc) == bc[2, 2]
  )

  for s = 1:nd, i = 1:(nh - 1)
    @constraint(
      nlp,
      sum(v[i, k] * h^(k - s) / prod(j for j = 1:(k - s)) for k = s:nd) +
      h^(nd - s + 1) * sum(w[i, k] / prod(j for j = 1:(k + nd - s)) for k = 1:nc) - v[i + 1, s] ==
      0.0
    )
  end

  for j = 1:nc, i = 1:nh
    @constraint(
      nlp,
      sum(w[i, k] * (ρ[j]^(k - 1) / prod(j for j = 1:(k - 1))) for k = 1:nc) -
      R * (
        (
          sum(v[i, k] * (ρ[j] * h)^(k - 2) / prod(j for j = 1:(k - 2)) for k = 2:nd) +
          h^(nd - 2 + 1) *
          sum(w[i, k] * ρ[j]^(k + nd - 2) / prod(j for j = 1:(k + nd - 2)) for k = 1:nc)
        ) * (
          sum(v[i, k] * (ρ[j] * h)^(k - 3) / prod(j for j = 1:(k - 3)) for k = 3:nd) +
          h^(nd - 3 + 1) *
          sum(w[i, k] * ρ[j]^(k + nd - 3) / prod(j for j = 1:(k + nd - 3)) for k = 1:nc)
        ) -
        (
          sum(v[i, k] * (ρ[j] * h)^(k - 1) / prod(j for j = 1:(k - 1)) for k = 1:nd) +
          h^(nd - 1 + 1) *
          sum(w[i, k] * ρ[j]^(k + nd - 1) / prod(j for j = 1:(k + nd - 1)) for k = 1:nc)
        ) * (
          sum(v[i, k] * (ρ[j] * h)^(k - 4) / prod(j for j = 1:(k - 4)) for k = 4:nd) +
          h^(nd - 4 + 1) *
          sum(w[i, k] * ρ[j]^(k + nd - 4) / prod(j for j = 1:(k + nd - 4)) for k = 1:nc)
        )
      ) == 0.0
    )
  end

  return nlp
end
