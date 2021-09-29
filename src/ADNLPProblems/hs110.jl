export hs110

function hs110(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(log(x[i] - 2)^2 + log(10 - x[i])^2 for i = 1:10) - prod(x[i] for i = 1:10)^(T(0.2))
  end
  x0 = 9 * ones(T, 10)
  lvar = T(2.001) * ones(T, 10)
  uvar = T(9.999) * ones(T, 10)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs110"; kwargs...)
end
