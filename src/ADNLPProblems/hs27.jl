export hs27

function hs27(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> T(0.01) * (x[1] - 1)^2 + (x[2] - x[1]^2)^2,
    2ones(T, 3),
    x -> [x[1] + x[3]^2 + 1],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs27";
    kwargs...,
  )
end
