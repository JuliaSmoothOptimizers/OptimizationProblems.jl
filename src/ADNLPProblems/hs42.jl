export hs42

function hs42(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - 1)^2 + (x[2] - 2)^2 + (x[3] - 3)^2 + (x[4] - 4)^2,
    ones(T, 4),
    x -> [x[1]; x[3]^2 + x[4]^2 - 2],
    T[2, 0],
    T[2, 0],
    name = "hs42_autodiff";
    kwargs...,
  )
end
