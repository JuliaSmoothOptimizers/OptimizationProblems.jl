export hs9

function hs9(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> sin(π * x[1] / 12) * cos(π * x[2] / 16),
    zeros(T, 2),
    [1; 1],
    [1; 2],
    T[4, -3],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs9";
    kwargs...,
  )
end
