export clplateb 
 
function clplateb(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplateb: number of variables adjusted from $n down to $(p*p)")
  n = p * p
  hp2 = 0.5 * p^2
  wght = -T(0.1)
  disw = wght / (p - 1)
  function f(x)
    return sum(disw * x[p, j] for j = 1:p) +
    sum(
      sum(0.5 * (x[i, j] - x[i, j - 1])^2 + hp2 * (x[i, j] - x[i, j - 1])^4 for j = 2:p) for i = 2:p
    ) +
    sum(0.5 * (x[2, j])^2 + hp2 * (x[2, j])^4 for j = 2:p) +
    sum(
      sum(0.5 * (x[i, j] - x[i - 1, j])^2 + hp2 * (x[i, j] - x[i - 1, j])^4 for j = 2:p) for i = 3:p
    )
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "clplateb"; kwargs...)
end
