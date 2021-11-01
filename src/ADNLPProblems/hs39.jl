export hs39

function hs39(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -x[1],
    2ones(T, 4),
    x -> [x[2] - x[1]^3 - x[3]^2; x[1]^2 - x[2] - x[4]^2],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs39_autodiff";
    kwargs...,
  )
end
