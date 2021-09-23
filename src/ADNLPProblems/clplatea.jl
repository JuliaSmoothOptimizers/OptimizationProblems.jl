export clplatea 
 
function clplatea(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplatea: number of variables adjusted from $n down to $(p*p)")
  n = p * p
  hp2 = 0.5 * p^2
  function f(x)
    return (wght * x[p, p]) +
    sum(
      sum(0.5 * (x[i, j] - x[i, j - 1])^2 + hp2 * (x[i, j] - x[i, j - 1])^4 for j = 2:p) for i = 2:p
    ) +
    sum(0.5 * (x[2, j])^2 + hp2 * (x[2, j])^4 for j = 2:p) +
    sum(
      sum(0.5 * (x[i, j] - x[i - 1, j])^2 + hp2 * (x[i, j] - x[i - 1, j])^4 for j = 2:p) for i = 3:p
    )
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "clplatea"; kwargs...)
end
