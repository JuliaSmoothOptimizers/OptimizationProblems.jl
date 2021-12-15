export tridia

function tridia(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + sum(i * (-x[i - 1] + 2 * x[i])^2 for i = 2:n)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tridia"; kwargs...)
end
