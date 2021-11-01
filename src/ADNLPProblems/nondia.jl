export nondia

function nondia(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("nondia: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + 100 * sum((x[1] - x[i]^2)^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "nondia_autodiff"; kwargs...)
end
