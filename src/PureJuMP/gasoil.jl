# Catalytic Cracking of Gas Oil Problem
# Collocation formulation
# Michael Merritt - Summer 2000
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

function gasoil(; n::Int = default_nvar, kwargs...)
  nc = 4        # number of collocation points
  ne = 2        # number of differential equations
  np = 3        # number of ODE parameters
  nm = 21       # number of measurements

  # roots of k-th degree Legendre polynomial
  rho = [0.06943184420297, 0.33000947820757, 0.66999052179243, 0.93056815579703]
  # ODE initial conditions
  bc = [1, 1, 2, 0]
  # times at which observations made
  tau = [0.0, 0.025, 0.05, 0.075, 0.10, 0.125, 0.150, 0.175, 0.20, 0.225, 0.250, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.65, 0.75, 0.85, 0.95]
  # ODEs defined in [0,tf]
  tf = tau[nm]
  # uniform interval length
  h = tf / n
  t = [(i-1)*h for i in 1:n+1]
  fact = [factorial(k) for k in 0:nc]

  itau = Int[min(n, floor(tau[i]/h)+1) for i in 1:nm]

  # Concentrations
  z = [
       1.0000        0;
       0.8105   0.2000;
       0.6208   0.2886;
       0.5258   0.3010;
       0.4345   0.3215;
       0.3903   0.3123;
       0.3342   0.2716;
       0.3034   0.2551;
       0.2735   0.2258;
       0.2405   0.1959;
       0.2283   0.1789;
       0.2071   0.1457;
       0.1669   0.1198;
       0.1530   0.0909;
       0.1339   0.0719;
       0.1265   0.0561;
       0.1200   0.0460;
       0.0990   0.0280;
       0.0870   0.0190;
       0.0770   0.0140;
       0.0690   0.0100;
      ]

  v0 = zeros(n, ne)
  # Starting-value
  for i in 1:itau[1], s in 1:ne
    v0[i, s] = bc[s]
  end
  for j in 2:nm, i =itau[j-1]+1:itau[j], s in 1:ne
    v0[i, s] = z[j, s]
  end
  for i in itau[nm]+1:n, s in 1:ne
    v0[i, s] = z[nm, s]
  end

  model = Model()

  # ODE parameters
  @variable(model, theta[1:np] >= 0.0, start=0.0)
  # The collocation approximation u is defined by the parameters v and w.
  # uc and Duc are, respectively, u and u' evaluated at the collocation points.
  @variable(model, v[i=1:n, s=1:ne], start=v0[i, s])
  @variable(model, w[1:n, 1:nc, 1:ne], start=0.0)
  @variable(model, uc[i=1:n, j=1:nc, s=1:ne], start=v0[i,s])
  @variable(model, Duc[i=1:n, j=1:nc, s=1:ne], start=0.0)

  @NLexpression(
    model,
    error[j=1:nm, s=1:ne],
    v[itau[j],s] + sum(w[itau[j],k,s]*(tau[j]-t[itau[j]])^k/(fact[k+1]*h^(k-1)) for k in 1:nc) - z[j,s],
  )
  # L2 error
  @NLobjective(model, Min, sum(error[j, s]^2 for s in 1:ne, j in 1:nm))

  # Collocation model
  @constraint(
    model,
    [i=1:n, j=1:nc, s=1:ne],
    uc[i, j, s] == v[i,s] + h*sum(w[i,k,s]*(rho[j]^k/fact[k+1]) for k in 1:nc),
  )
  @constraint(
    model,
    [i=1:n, j=1:nc, s=1:ne],
    Duc[i, j, s] == sum(w[i,k,s]*(rho[j]^(k-1)/fact[k]) for k in 1:nc),
  )

  # Boundary
  @constraint(model, [s=1:ne], v[1, s] == z[1, s]) #TODO
  # Continuity
  @constraint(
    model,
    [i=1:n-1, s=1:ne],
    v[i, s] + sum(w[i, j, s]*h/fact[j+1] for j in 1:nc) == v[i+1, s],
  )
  @NLconstraint(
    model,
    [i=1:n, j=1:nc],
    Duc[i, j, 1] == -(theta[1]+theta[3])*uc[i, j, 1]^2,
  )
  @NLconstraint(
    model,
    [i=1:n, j=1:nc],
    Duc[i, j, 2] == theta[1]*uc[i,j,1]^2 - theta[2]*uc[i,j,2],
  )
  return model
end

