# Catalyst Mixing Problem
# Collocation formulation
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export catmix

function catmix(args...; n::Int = default_nvar, kwargs...)
  ne = 2
  nc = 3

  tf = 1
  h = tf / n   # Final time
  fact = [factorial(k) for k = 0:nc]

  rho = [0.11270166537926, 0.50000000000000, 0.88729833462074]
  bc = [1.0, 0.0]  # Boundary conditions for x
  alpha = 0.0      # Smoothing parameter

  model = Model()

  @variable(model, 0.0 <= u[i = 1:n, j = 1:nc] <= 1.0, start=0.0)
  @variable(model, v[i = 1:n, s = 1:ne], start=mod(s, ne))
  @variable(model, w[i = 1:n, j = 1:nc, s = 1:ne], start=0.0)
  @variable(model, pp[i = 1:n, j = 1:nc, s = 1:ne], start=mod(s, ne))
  @variable(model, Dpp[i = 1:n, j = 1:nc, s = 1:ne], start=0.0)
  @variable(model, ppf[s = 1:ne], start=mod(s, ne))

  @objective(
    model,
    Min,
    -1.0 + ppf[1] + ppf[2] + alpha/h*sum((u[i + 1, j] - u[i, j])^2 for i = 1:(n - 1), j = 1:nc)
  )

  # Collocation model
  @constraint(
    model,
    [i=1:n, k=1:nc, s=1:ne],
    pp[i, k, s] == v[i, s] + h*sum(w[i, j, s]*(rho[k]^j/fact[j + 1]) for j = 1:nc)
  )
  @constraint(
    model,
    [i=1:n, k=1:nc, s=1:ne],
    Dpp[i, k, s] == sum(w[i, j, s]*(rho[k]^(j-1)/fact[j]) for j = 1:nc)
  )
  @constraint(model, [s=1:ne], ppf[s] == v[n, s] + h * sum(w[n, j, s] / fact[j + 1] for j = 1:nc))
  # Continuity
  @constraint(
    model,
    continuity[i = 1:(n - 1), s = 1:ne],
    v[i, s] + sum(w[i, j, s] * h / fact[j + 1] for j = 1:nc) == v[i + 1, s]
  )
  # Dynamics
  @constraint(
    model,
    de1[i = 1:n, j = 1:nc],
    Dpp[i, j, 1] == u[i, j] * (10.0*pp[i, j, 2] - pp[i, j, 1]),
  )
  @constraint(
    model,
    de2[i = 1:n, j = 1:nc],
    Dpp[i, j, 2] == u[i, j] * (pp[i, j, 1] - 10.0*pp[i, j, 2]) - (1 - u[i, j])*pp[i, j, 2]
  )
  @constraint(model, b_eqn[s = 1:ne], v[1, s] == bc[s])

  return model
end
