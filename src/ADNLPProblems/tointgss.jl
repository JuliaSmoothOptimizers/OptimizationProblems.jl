export tointgss

function tointgss(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 3 && @warn("tointgss: number of variables must be ≥ 3")
  n = max(3, n)
  function f(x)
    n = length(x)
    return sum(
      ((10 // (n + 2)) + x[i + 2]^2) * (2 - exp(-(x[i] - x[i + 1])^2 / (1 // 10 + x[i + 2]^2))) for
      i = 1:(n - 2)
    )
  end
  x0 = 3 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tointgss"; kwargs...)
end
