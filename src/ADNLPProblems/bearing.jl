export bearing

function bearing(;
  n::Int = default_nvar,
  nx::Int = Int(round(sqrt(max(n, 1)))) - 2,
  ny::Int = Int(round(sqrt(max(n, 1)))) - 2,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  # nx > 0 # grid points in 1st direction
  # ny > 0 # grid points in 2nd direction

  # Ensure nx and ny are at least 1, and warn if they need adjustment
  nx_orig = nx
  ny_orig = ny
  nx = max(1, nx)
  ny = max(1, ny)
  if nx != nx_orig || ny != ny_orig
    msg_parts = String[]
    if nx != nx_orig
      push!(msg_parts, "nx from $(nx_orig) to $(nx)")
    end
    if ny != ny_orig
      push!(msg_parts, "ny from $(ny_orig) to $(ny)")
    end
    @warn("bearing: grid dimensions adjusted: " * join(msg_parts, ", "))
  end

  b = 10  # grid is (0,2*pi)x(0,2*b)
  e = 1 // 10 # eccentricity

  # pi = 4 * atan(1);
  hx = 2 * pi / (nx + 1)  # grid spacing
  hy = 2 * b // (ny + 1)   # grid spacing

  wq = [(1 + e * cos(i * hx))^3 for i = 0:(nx + 1)]

  x0 = T[max(sin(i * hx), 0) for i = 1:(nx + 2), j = 1:(ny + 2)][:]

  lvar = zeros(T, (nx + 2) * (ny + 2))
  uvar = T(Inf) * ones(T, (nx + 2) * (ny + 2))
  for i = 1:(nx + 2)
    uvar[i] = zero(T)
    uvar[end - i + 1] = zero(T)
  end
  for j = 1:(ny + 2)
    uvar[(j - 1) * (nx + 2) + 1] = zero(T)
    uvar[j * (nx + 2)] = zero(T)
  end

  function f(x::AbstractVector{Ti}; hx = Ti(hx), hy = Ti(hy), wq = Ti.(wq)) where {Ti}
    v = reshape_array(x, (nx + 2, ny + 2))
    return 1 // 2 *
           (hx * hy / 6) *
           sum(
             (wq[i + 1] + 2 * wq[i + 2]) * (
               ((v[i + 2, j + 1] - v[i + 1, j + 1]) / hx)^2 +
               ((v[i + 1, j + 2] - v[i + 1, j + 1]) / hy)^2
             ) for i = 0:nx, j = 0:ny
           ) +
           1 // 2 *
           (hx * hy / 6) *
           sum(
             (2 * wq[i + 1] + 2 * wq[i]) *
             (((v[i, j + 1] - v[i + 1, j + 1]) / hx)^2 + ((v[i + 1, j] - v[i + 1, j + 1]) / hy)^2)
             for i = 1:(nx + 1), j = 1:(ny + 1)
           ) - hx * hy * sum(e * sin(i * hx) * v[i + 1, j + 1] for i = 0:(nx + 1), j = 0:(ny + 1))
  end

  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "bearing"; kwargs...)
end
