export AMPGO09

function AMPGO09(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return sin(x[1]) + sin(2 // 3 * x[1])
  end
  x0 = T[3.1]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO09"; kwargs...)
end
