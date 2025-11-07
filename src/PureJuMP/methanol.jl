# Methanol-to-Hydrocarbons Problem
# Collocation formulation
# Michael Merritt - Summer 2000
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export methanol

function methanol(args...; n::Int = default_nvar, kwargs...)
  ne = 3
  np = 5
  nc = 3
  nm = 17

  rho = [0.11270166537926, 0.5, 0.88729833462074]
  # times at which observations made
  tau = [
    0,
    0.050,
    0.065,
    0.080,
    0.123,
    0.233,
    0.273,
    0.354,
    0.397,
    0.418,
    0.502,
    0.553,
    0.681,
    0.750,
    0.916,
    0.937,
    1.122,
  ]
  tf = tau[nm]                   # ODEs defined in [0,tf]
  h = tf / n                    # uniform interval length
  t = [(i-1)*h for i = 1:(n + 1)]  # partition
  fact = [factorial(k) for k = 0:nc]

  # itau[i] is the largest integer k with t[k] <= tau[i]
  itau = Int[min(n, floor(tau[i]/h)+1) for i = 1:nm]

  # Concentrations
  z = [
    1.0000 0 0;
    0.7085 0.1621 0.0811;
    0.5971 0.1855 0.0965;
    0.5537 0.1989 0.1198;
    0.3684 0.2845 0.1535;
    0.1712 0.3491 0.2097;
    0.1198 0.3098 0.2628;
    0.0747 0.3576 0.2467;
    0.0529 0.3347 0.2884;
    0.0415 0.3388 0.2757;
    0.0261 0.3557 0.3167;
    0.0208 0.3483 0.2954;
    0.0085 0.3836 0.2950;
    0.0053 0.3611 0.2937;
    0.0019 0.3609 0.2831;
    0.0018 0.3485 0.2846;
    0.0006 0.3698 0.2899;
  ]

  bc = [1.0, 0.0, 0.0]

  # Starting-value
  v0 = zeros(n, ne)
  for i = 1:itau[1], s = 1:ne
    v0[i, s] = bc[s]
  end
  for j = 2:nm, i = (itau[j - 1] + 1):itau[j], s = 1:ne
    v0[i, s] = z[j, s]
  end
  for i = (itau[nm] + 1):n, s = 1:ne
    v0[i, s] = z[nm, s]
  end
  v0 .= 0.001

  model = Model()

  @variable(model, theta[1:np] >= 0.0, start=1.0) # ODE parameters
  @variable(model, v[i = 1:n, s = 1:ne], start=v0[i, s])
  @variable(model, w[i = 1:n, j = 1:nc, s = 1:ne], start=0.0)
  @variable(model, uc[i = 1:n, j = 1:nc, s = 1:ne], start=v0[i, s])
  @variable(model, Duc[i = 1:n, j = 1:nc, s = 1:ne], start=0.0)

  # error
  @expression(
    model,
    error[j = 1:nm, s = 1:ne],
    v[itau[j], s] + sum(w[itau[j], k, s]*(tau[j]-t[itau[j]])^k/(fact[k + 1]*h^(k-1)) for k = 1:nc) -
    z[j, s]
  )

  # L2 error
  @objective(model, Min, sum(error[j, s]^2 for j = 1:nm, s = 1:ne))

  # Collocation model
  @constraint(
    model,
    [i=1:n, j=1:nc, s=1:ne],
    uc[i, j, s] == v[i, s] + h*sum(w[i, k, s]*(rho[j]^k/fact[k + 1]) for k = 1:nc),
  )
  @constraint(
    model,
    [i=1:n, j=1:nc, s=1:ne],
    Duc[i, j, s] == sum(w[i, k, s]*(rho[j]^(k-1)/fact[k]) for k = 1:nc),
  )
  # Boundary
  @constraint(model, bc_cond[s = 1:ne], v[1, s] == bc[s])
  # Continuity
  @constraint(
    model,
    [i=1:(n - 1), s=1:ne],
    v[i, s] + sum(w[i, j, s]*h/fact[j + 1] for j = 1:nc) == v[i + 1, s]
  )
  # Dynamics
  @constraint(
    model,
    collocation_eqn1[i = 1:n, j = 1:nc],
    Duc[i, j, 1] ==
    - (
      2*theta[2] - (theta[1]*uc[i, j, 2])/((theta[2]+theta[5])*uc[i, j, 1]+uc[i, j, 2]) +
      theta[3] +
      theta[4]
    )*uc[i, j, 1]
  )
  @constraint(
    model,
    collocation_eqn2[i = 1:n, j = 1:nc],
    Duc[i, j, 2] ==
    (theta[1]*uc[i, j, 1]*(theta[2]*uc[i, j, 1]-uc[i, j, 2])) /
    ((theta[2]+theta[5])*uc[i, j, 1]+uc[i, j, 2]) + theta[3]*uc[i, j, 1]
  )
  @constraint(
    model,
    collocation_eqn3[i = 1:n, j = 1:nc],
    Duc[i, j, 3] ==
    (theta[1]*uc[i, j, 1]*(uc[i, j, 2]+theta[5]*uc[i, j, 1])) /
    ((theta[2]+theta[5])*uc[i, j, 1]+uc[i, j, 2]) + theta[4]*uc[i, j, 1]
  )

  return model
end
