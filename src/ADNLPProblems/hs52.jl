export hs52

function hs52(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (4 * x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2,
    2 * ones(T, 5),
    x -> [x[1] + 3 * x[2]; x[3] + x[4] - 2 * x[5]; x[2] - x[5]],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs52";
    kwargs...,
  )
end
