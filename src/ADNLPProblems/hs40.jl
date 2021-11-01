export hs40

function hs40(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -x[1] * x[2] * x[3] * x[4],
    T(0.8) * ones(T, 4),
    x -> [x[1]^3 + x[2]^2 - 1; x[4] * x[1]^2 - x[3]; x[4]^2 - x[2]],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs40_autodiff";
    kwargs...,
  )
end
