export hs63

function hs63(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> 1000 - x[1]^2 - 2 * x[2]^2 - x[3]^2 - x[1] * x[2] - x[1] * x[3],
    2 * ones(T, 3),
    zeros(T, 3),
    T(Inf) * ones(T, 3),
    x -> [8 * x[1] + 14 * x[2] + 7 * x[3]; x[1]^2 + x[2]^2 + x[3]^2],
    T[56, 25],
    T[56, 25],
    name = "hs63",
    lin = [1];
    kwargs...,
  )
end
