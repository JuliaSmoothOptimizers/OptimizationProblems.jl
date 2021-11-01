export dqdrtic

function dqdrtic(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(x[i]^2 + 100 * (x[i + 1]^2 + x[i + 2]^2) for i = 1:(n - 2))
  end
  x0 = 3 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dqdrtic_autodiff"; kwargs...)
end
