export hs211

function hs211(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  f(x) = 100 * (x[2] - x[1]^3)^2 + (1 - x[1])^2
  x0 = T[-1.2, 1.0]
  nlp = ADNLPModels.ADNLPModel(f, x0, name = "hs211"; kwargs...)
  return nlp
end
