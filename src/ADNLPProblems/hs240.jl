export hs240

function hs240(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1] - x[2] + x[3])^2 + (-x[1] + x[2] + x[3])^2 + (x[1] + x[2] - x[3])^2
  end
  x0 = T[100, -1, 2.5]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs240"; kwargs...)
end
