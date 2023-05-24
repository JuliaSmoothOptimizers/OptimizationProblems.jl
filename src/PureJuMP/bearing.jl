# Given observations of ns stages of a bearing species over n timesteps, 
# minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x) 

#   This is problem 16 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

# Journal bearing problem
# Michael Merritt - Summer 2000
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export bearing

function bearing(
  args...;
  n::Int = default_nvar,
  nx::Int = Int(round(sqrt(max(n, 1)))) - 2,
  ny::Int = Int(round(sqrt(max(n, 1)))) - 2,
  kwargs...,
)
  nlp = Model()

  # nx > 0 # grid points in 1st direction
  # ny > 0 # grid points in 2nd direction

  b = 10  # grid is (0,2*pi)x(0,2*b)
  e = 0.1 # eccentricity

  # pi = 4 * atan(1);
  hx = 2 * pi / (nx + 1)  # grid spacing
  hy = 2 * b / (ny + 1)   # grid spacing

  wq = [(1 + e * cos(i * hx))^3 for i = 0:(nx + 1)]

  uvar = Inf * ones(nx + 2, ny + 2)
  uvar[1:(nx + 2), 1:1] .= 0
  uvar[1:(nx + 2), (ny + 2):(ny + 2)] .= 0
  uvar[1:1, 1:(ny + 2)] .= 0
  uvar[(nx + 2):(nx + 2), 1:(ny + 2)] .= 0

  # var v {i in 0..nx+1, 0..ny+1} >= 0;
  @variable(nlp, uvar[i, j] >= v[i = 1:(nx + 2), j = 1:(ny + 2)] >= 0, start = max(sin(i * hx), 0))

  @NLobjective(
    nlp,
    Min,
    0.5 *
    (hx * hy / 6) *
    sum(
      (wq[i + 1] + 2 * wq[i + 2]) *
      (((v[i + 2, j + 1] - v[i + 1, j + 1]) / hx)^2 + ((v[i + 1, j + 2] - v[i + 1, j + 1]) / hy)^2)
      for i = 0:nx, j = 0:ny
    ) +
    0.5 *
    (hx * hy / 6) *
    sum(
      (2 * wq[i + 1] + 2 * wq[i]) *
      (((v[i, j + 1] - v[i + 1, j + 1]) / hx)^2 + ((v[i + 1, j] - v[i + 1, j + 1]) / hy)^2) for
      i = 1:(nx + 1), j = 1:(ny + 1)
    ) - hx * hy * sum(e * sin(i * hx) * v[i + 1, j + 1] for i = 0:(nx + 1), j = 0:(ny + 1))
  )

  return nlp
end
