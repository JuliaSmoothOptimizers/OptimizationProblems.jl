# Minimal surface with obstacle problem

#  Find the surface with minimal area, given boundary conditions,
#  and above an obstacle.

#  This is problem 17=the COPS (Version 3) collection of
#  E. Dolan and J. More'
#  see "Benchmarking Optimization Software with COPS"
#  Argonne National Labs Technical Report ANL/MCS-246 (2004)
#  classification OBR2-AN-V-V

export minsurf

function minsurf(args...; n = default_nvar, kwargs...)
  # number of variables is (nx + 2) x (ny + 2)
  if !((:nx in keys(kwargs)) & (:ny in keys(kwargs)))
    nx, ny = Int(round(sqrt(max(1, n - 2)))), Int(round(sqrt(max(1, n - 2))))
  end
  x_mesh = LinRange(0, 1, nx + 2) # coordinates of the mesh points x

  v0 = zeros(nx + 2, ny + 2) # Surface matrix initialization
  for i = 1:(nx + 2), j = 1:(ny + 2)
    v0[i, j] = 1 - (2 * x_mesh[i] - 1)^2
  end

  hx = 1 / (nx + 1)
  hy = 1 / (ny + 1)
  area = 1 // 2 * hx * hy

  nlp = Model()

  @variable(nlp, v[i = 1:(nx + 2), j = 1:(ny + 2)], start = v0[i, j])

  @objective(
    nlp,
    Min,
    sum(
      area * (1 + ((v[i + 1, j] - v[i, j]) / hx)^2 + ((v[i, j + 1] - v[i, j]) / hy)^2)^(1 / 2) for
      i = 1:(nx + 1), j = 1:(ny + 1)
    ) + sum(
      area * (1 + ((v[i - 1, j] - v[i, j]) / hx)^2 + ((v[i, j - 1] - v[i, j]) / hy)^2)^(1 / 2) for
      i = 2:(nx + 2), j = 2:(ny + 2)
    )
  )

  @constraint(nlp, [j = 0:(ny + 1)], v[1, j + 1] == 0)
  @constraint(nlp, [j = 0:(ny + 1)], v[nx + 2, j + 1] == 0)
  @constraint(nlp, [i = 0:(nx + 1)], v[i + 1, 1] == 1 - (2 * i * hx - 1)^2)
  @constraint(nlp, [i = 0:(nx + 1)], v[i + 1, ny + 2] == 1 - (2 * i * hx - 1)^2)
  @constraint(nlp, [i = 0:(nx + 1), j = 0:(ny + 1)], v[i + 1, j + 1] >= 0)
  @constraint(
    nlp,
    [
      i = Int(floor(0.25 / hx)):Int(ceil(0.75 / hx)),
      j = Int(floor(0.25 / hy)):Int(ceil(0.75 / hy)),
    ],
    v[i + 1, j + 1] >= 1
  )

  return nlp
end
