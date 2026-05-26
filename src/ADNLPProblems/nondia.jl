export nondia

function nondia(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("nondia", n_org, n)
  function f(x; n = length(x))
    return (x[1] - 1)^2 + 100 * sum((x[1] - x[i]^2)^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "nondia"; kwargs...)
end
