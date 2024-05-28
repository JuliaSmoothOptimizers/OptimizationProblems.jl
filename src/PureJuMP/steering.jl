# Rocket Steering Problem
# Trapezoidal formulation
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export steering

function steering(; n::Int=default_nvar, kwargs...)
  a = 100.0  # Magnitude of force.
  # Bounds on the control
  u_min, u_max = -pi/2.0, pi/2.0
  xs = zeros(4)
  xf = [NaN, 5.0, 45.0, 0.0]

  function gen_x0(k, i)
    if i == 1 || i == 4
      return 0.0
    elseif i == 2
      return 5*k/n
    elseif i == 3
      return 45.0*k/n
    end
  end

  model = Model()

  @variable(model, u_min <= u[i=1:n+1] <= u_max, start=0.0)   # control
  @variable(model, x[i=1:n+1, j=1:4], start=gen_x0(i, j))     # state
  @variable(model, tf, start=1.0)                              # final time

  @expression(model, h, tf / n) # step size
  @objective(model, Min, tf)

  @constraint(model, tf >= 0.0)
  # Dynamics
  @NLconstraints(
    model, begin
      [i=1:n], x[i+1,1] == x[i,1] + 0.5*h*(x[i,3] + x[i+1,3])
      [i=1:n], x[i+1,2] == x[i,2] + 0.5*h*(x[i,4] + x[i+1,4])
      [i=1:n], x[i+1,3] == x[i,3] + 0.5*h*(a*cos(u[i]) + a*cos(u[i+1]))
      [i=1:n], x[i+1,4] == x[i,4] + 0.5*h*(a*sin(u[i]) + a*sin(u[i+1]))
    end
  )
  # Boundary conditions
  @constraint(model , [j=1:4], x[1, j] == xs[j])
  @constraint(model , [j=2:4], x[n+1, j] == xf[j])
  return model
end

