export engval1

function engval1(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("engval : n ≥ 2")
  function f(x)
    n = length(x)
    return sum((x[i]^2 + x[i + 1]^2)^2 - 4 * x[i] + 3 for i = 1:(n - 1))
  end
  x0 = 2 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "engval1_autodiff"; kwargs...)
end
