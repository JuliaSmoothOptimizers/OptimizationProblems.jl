export hs6

function hs6(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> 1 // 2 * (x[1] - 1)^2,
    T[-1.2; 1.0],
    x -> [10 * (x[2] - x[1]^2)],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs6";
    kwargs...,
  )
end
