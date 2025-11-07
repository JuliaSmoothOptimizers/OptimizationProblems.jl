# Hang Glider Problem
# Trapezoidal formulation
# David Bortz - Summer 1998
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export glider

function glider(; n::Int = default_nvar, kwargs...)
  # Design parameters
  x_0 = 0.0
  y_0 = 1000.0
  y_f = 900.0
  vx_0 = 13.23
  vx_f = 13.23
  vy_0 = -1.288
  vy_f = -1.288
  u_c = 2.5
  r_0 = 100.0
  m = 100.0
  g = 9.81
  c0 = 0.034
  c1 = 0.069662
  S = 14.0
  rho = 1.13
  cL_min = 0.0
  cL_max = 1.4

  model = Model()

  @variables(model, begin
    0 <= t_f,                       (start=1.0)
    0.0 <= x[k=0:n],               (start=x_0 + vx_0*(k/n))
    y[k=0:n],                      (start=y_0 + (k/n)*(y_f - y_0))
    0.0 <= vx[k=0:n],              (start=vx_0)
    vy[k=0:n],                     (start=vy_0)
    cL_min <= cL[k=0:n] <= cL_max, (start=cL_max/2.0)
  end)

  @objective(model, Max, x[n])

  @expressions(model, begin
    step,           t_f / n
    r[i=0:n],      (x[i]/r_0 - 2.5)^2
    u[i=0:n],      u_c*(1 - r[i])*exp(-r[i])
    w[i=0:n],      vy[i] - u[i]
    v[i=0:n],      sqrt(vx[i]^2 + w[i]^2)
    D[i=0:n],      0.5*(c0+c1*cL[i]^2)*rho*S*v[i]^2
    L[i=0:n],      0.5*cL[i]*rho*S*v[i]^2
    vx_dot[i=0:n], (-L[i]*(w[i]/v[i]) - D[i]*(vx[i]/v[i]))/m
    vy_dot[i=0:n], (L[i]*(vx[i]/v[i]) - D[i]*(w[i]/v[i]))/m - g
  end)

  # Dynamics
  @constraints(model, begin
    x_eqn[j=1:n],  x[j] == x[j-1] + 0.5 * step * (vx[j] + vx[j-1])
    y_eqn[j=1:n],  y[j] == y[j-1] + 0.5 * step * (vy[j] + vy[j-1])
    vx_eqn[j=1:n], vx[j] == vx[j-1] + 0.5 * step * (vx_dot[j] + vx_dot[j-1])
    vy_eqn[j=1:n], vy[j] == vy[j-1] + 0.5 * step * (vy_dot[j] + vy_dot[j-1])
  end)
  # Boundary constraints
  @constraints(model, begin
    x[0] == x_0
    y[0] == y_0
    y[n] == y_f
    vx[0] == vx_0
    vx[n] == vx_f
    vy[0] == vy_0
    vy[n] == vy_f
  end)

  return model
end


