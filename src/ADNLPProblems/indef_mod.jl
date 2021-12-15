export indef_mod

function indef_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 3 || error("indef : n ≥ 3")
  function f(x)
    n = length(x)
    return 100 * sum(sin(x[i] / 100) for i = 1:n) +
           T(0.5) * sum(cos(2 * x[i] - x[n] - x[1]) for i = 2:(n - 1))
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "indef"; kwargs...)
end
