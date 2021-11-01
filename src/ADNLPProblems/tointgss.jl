export tointgss

function tointgss(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 3 || error("tointgss : n ≥ 3")
  function f(x)
    n = length(x)
    return sum(
      (T(10 / (n + 2)) + x[i + 2]^2) * (2 - exp(-(x[i] - x[i + 1])^2 / (T(0.1) + x[i + 2]^2))) for
      i = 1:(n - 2)
    )
  end
  x0 = 3 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tointgss_autodiff"; kwargs...)
end
