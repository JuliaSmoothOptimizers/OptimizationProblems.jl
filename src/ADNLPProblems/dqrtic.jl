export dqrtic

function dqrtic(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum((x[i] - i)^4 for i = 1:n)
  end
  x0 = 2 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dqrtic_autodiff"; kwargs...)
end
