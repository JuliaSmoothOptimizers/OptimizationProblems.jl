export Dus2_3

function Dus2_3(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 - (1 / (5 * (x[1]^2) - 6 * x[1] + 5))
  end
  x0 = T[-2]
  return ADNLPModels.ADNLPModel(f, x0, name = "Dus2_3"; kwargs...)
end
