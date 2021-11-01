export hs50

function hs50(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^2,
    T[35, -31, 11, 5, -5],
    x -> [
      x[1] + 2 * x[2] + 3 * x[3]
      x[2] + 2 * x[3] + 3 * x[4]
      x[3] + 2 * x[4] + 3 * x[5]
    ],
    6 * ones(T, 3),
    6 * ones(T, 3),
    name = "hs50_autodiff";
    kwargs...,
  )
end
