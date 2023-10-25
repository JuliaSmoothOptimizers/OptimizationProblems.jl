export hs1

function hs1(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[-2, 1]
  lvar = T[-Inf, -1.5]
  uvar = T[Inf, Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs1"; kwargs...)
end
