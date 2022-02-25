export tquartic

function tquartic(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("tquartic: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + sum((x[1]^2 - x[i + 1]^2)^2 for i = 1:(n - 2))
  end
  x0 = T(0.1) * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tquartic"; kwargs...)
end
