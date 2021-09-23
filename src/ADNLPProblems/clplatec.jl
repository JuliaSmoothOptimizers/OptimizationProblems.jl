export clplatec 
 
function clplatec(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplatec: number of variables adjusted from $n down to $(p*p)")
  n = p * p
  wght = -T(0.1)
  r = T(0.99)
  l = T(0.01)
  hp2 = 0.5 * p^2
  wr = wght * r
  wl = wght * l
  function f(x)
    return wr * x[p, p] +
    wl * x[p, 1] +
    sum(sum(hp2 * (x[i, j] - x[i, j - 1])^2 + (x[i, j] - x[i, j - 1])^4 for j = 2:p) for i = 2:p) +
    sum(sum(0.5 * (x[i, j] - x[i - 1, j])^2 + (x[i, j] - x[i - 1, j])^4 for j = 2:p) for i = 3:p) +
    sum(0.5 * (x[2, j])^2 + (x[2, j])^4 for j = 2:p)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "clplatec"; kwargs...)
end
