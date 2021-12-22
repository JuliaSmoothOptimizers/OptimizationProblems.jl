export hs9

function hs9(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> sin(π * x[1] / 12) * cos(π * x[2] / 16),
    zeros(T, 2),
    x -> [4 * x[1] - 3 * x[2]],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs9",
    lin = [1];
    kwargs...,
  )
end
