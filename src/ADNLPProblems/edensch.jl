export edensch

function edensch(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 16 + sum(
      (x[i] - 2)^4 + (x[i] * x[i + 1] - 2 * x[i + 1])^2 + (x[i + 1] + 1)^2 for i = 1:(n - 1)
    )
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "edensch_autodiff"; kwargs...)
end
