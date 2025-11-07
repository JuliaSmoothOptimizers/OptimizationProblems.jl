# Torsion problem
# Liz Dolan - Summer 2000
# Version 2.0 - October 2000
# COPS 3.1 - March 2004

export torsion

function torsion(args...; n = default_nvar, kwargs...)
  # number of variables is (nx + 1) x (ny + 1)
  if !((:nx in keys(kwargs)) & (:ny in keys(kwargs)))
    nx, ny = Int(round(sqrt(max(1, n - 2)))), Int(round(sqrt(max(1, n - 2))))
  end
  c = 5.0
  hx = 1.0 / (nx + 1.0)    # grid spacing
  hy = 1.0 / (ny + 1.0)    # grid spacing
  area = 0.5 * hx * hy     # area of triangle

  # Distance to the boundary.
  D = [min(min(i,nx-i+1)*hx, min(j, ny-j+1)*hy) for i in 0:nx+1, j in 0:ny+1]

  model = Model()
  # v defines the finite element approximation.
  @variable(model, v[i=0:nx+1, j=0:ny+1], start=D[i+1, j+1])

  @expression(
    model,
    linLower,
    sum(v[i+1, j] + v[i, j] + v[i, j+1] for i in 0:nx, j in 0:ny)
  )
  @expression(
    model,
    linUpper,
    sum(v[i, j] + v[i-1, j] + v[i, j-1] for i in 1:nx+1, j in 1:ny+1)
  )
  @expression(
    model,
    quadLower,
    sum(((v[i+1,j] - v[i,j])/hx)^2 + ((v[i,j+1] - v[i,j])/hy)^2 for i in 0:nx, j in 0:ny)
  )
  @expression(
    model,
    quadUpper,
    sum(((v[i,j] - v[i-1,j])/hx)^2 + ((v[i,j] - v[i,j-1])/hy)^2 for i in 1:nx+1, j in 1:ny+1)
  )

  @objective(model, Min, area * ((quadLower + quadUpper) / 2.0 - c * (linLower + linUpper) / 3.0))

  @constraint(model, [i=0:nx+1, j=0:ny+1], -D[i+1, j+1] <= v[i, j] <= D[i+1, j+1])

  return model
end

