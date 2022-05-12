export hs79

function hs79(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^4,
    2 * ones(T, 5),
    x -> [
      x[2] - x[3]^2 + x[4]
      x[1] * x[5]
      x[1] + x[2]^2 + x[3]^3 - 2 - 3 * T(sqrt(2))
    ],
    T[-2 + 2 * sqrt(2), 2, 0],
    T[-2 + 2 * sqrt(2), 2, 0],
    name = "hs79";
    kwargs...,
  )
end
