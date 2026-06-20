export hs203

function hs203(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (3 // 2 - x[1] * (1 - x[2]))^2 +
           (9 // 4 - x[1] * (1 - x[2]^2))^2 +
           (21 // 8 - x[1] * (1 - x[2]^3))^2
  end
  x0 = T[2, 1 // 5]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs203"; kwargs...)
end
