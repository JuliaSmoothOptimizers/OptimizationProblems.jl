export hs229

function hs229(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[-1.2, 1]
  lvar = T[-2, -2]
  uvar = T[2, 2]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs229"; kwargs...)
end
