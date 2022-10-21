export hs8

function hs8(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -one(eltype(x)),
    T[2.0; 1.0],
    x -> [x[1]^2 + x[2]^2 - 25; x[1] * x[2] - 9],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs8";
    kwargs...,
  )
end
