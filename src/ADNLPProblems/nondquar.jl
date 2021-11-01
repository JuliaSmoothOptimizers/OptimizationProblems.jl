export nondquar

function nondquar(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - x[2])^2 + (x[n - 1] - x[n])^2 + sum((x[i] + x[i + 1] + x[n])^4 for i = 1:(n - 2))
  end

  x0 = ones(T, n)
  x0[2 * collect(1:div(n, 2))] .= -one(T)
  return ADNLPModels.ADNLPModel(f, x0, name = "nondquar_autodiff"; kwargs...)
end
