export hs202

function hs202(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    t1 = -13 + x[1] + ((5 - x[2]) * x[2] - 2) * x[2]
    t2 = -29 + x[1] + ((1 + x[2]) * x[2] - 14) * x[2]
    return t1^2 + t2^2
  end
  x0 = T[15, -2]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs202"; kwargs...)
end
