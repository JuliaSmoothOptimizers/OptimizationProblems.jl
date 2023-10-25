export AMPGO04

function AMPGO04(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(16 * x[1]^2 - 24 * x[1] + 5) * exp(-x[1])
  end
  x0 = T[1.9]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO04"; kwargs...)
end
