export genrose_nash

function genrose_nash(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("genrose_nash : n ≥ 2")
  function f(x)
    n = length(x)
    return 1 + 100 * sum((x[i] - x[i - 1]^2)^2 for i = 2:n) + sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "genrose_nash_autodiff"; kwargs...)
end
