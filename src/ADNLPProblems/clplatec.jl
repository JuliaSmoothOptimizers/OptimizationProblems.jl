export clplatec

function clplatec(;
  n::Int = default_nvar,
  type::Type{T} = Float64,
  wght = -0.1,
  r = 0.99,
  l = 0.01,
  kwargs...,
) where {T}
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplatec: number of variables adjusted from $n down to $(p*p)")
  n = p * p

  hp2 = 1 // 2 * p^2
  function f(x; p = p, hp2 = hp2, wght = wght, r = r, l = l)
    return eltype(x)(wght * r) * x[p + (p - 1) * p] +
           eltype(x)(wght * l) * x[p] +
           sum(
             sum(
               hp2 * (x[i + (j - 1) * p] - x[i + (j - 2) * p])^2 +
               (x[i + (j - 1) * p] - x[i + (j - 2) * p])^4 for j = 2:p
             ) for i = 2:p
           ) +
           sum(
             sum(
               1 // 2 * (x[i + (j - 1) * p] - x[i - 1 + (j - 1) * p])^2 +
               (x[i + (j - 1) * p] - x[i - 1 + (j - 1) * p])^4 for j = 2:p
             ) for i = 3:p
           ) +
           sum(1 // 2 * (x[2 + (j - 1) * p])^2 + (x[2 + (j - 1) * p])^4 for j = 2:p)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "clplatec"; kwargs...)
end
