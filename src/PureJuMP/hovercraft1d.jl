# JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
# Introduction to Optimization class.

# Hovercraft 1D example
# https://laurentlessard.com/teaching/524-intro-to-optimization/
export hovercraft1d

function hovercraft1d(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  T = div(n, 3)           # length of time horizon
  @variable(nlp, x[1:T])    # resulting position
  @variable(nlp, v[1:T])    # resulting velocity
  @variable(nlp, u[1:(T - 1)])  # thruster input

  # constraint on start and end positions and velocities
  @constraint(nlp, x[1] == 0)
  @constraint(nlp, v[1] == 0)
  @constraint(nlp, x[T] == 100)
  @constraint(nlp, v[T] == 0)

  # satisfy the dynamics
  for i = 1:(T - 1)
    @constraint(nlp, x[i + 1] == x[i] + v[i])
  end
  for i = 1:(T - 1)
    @constraint(nlp, v[i + 1] == v[i] + u[i])
  end

  # minimize 2-norm
  @objective(nlp, Min, sum(u .^ 2))
  return nlp
end
