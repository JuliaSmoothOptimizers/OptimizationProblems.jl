export AMPGO11

function AMPGO11(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2 * cos(x[1]) + cos(2 * x[1])
  end
  x0 = T[-pi]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO11"; kwargs...)
end
