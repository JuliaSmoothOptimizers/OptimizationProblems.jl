export dixon3dq

function dixon3dq(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    return (x[1] - 1)^2 + (x[n] - 1)^2 + sum((x[i] - x[i + 1])^2 for i = 2:(n - 1))
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dixon3dq"; kwargs...)
end
