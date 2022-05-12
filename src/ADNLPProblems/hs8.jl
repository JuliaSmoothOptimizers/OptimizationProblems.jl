export hs8

function hs8(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -T(1),
    T[2.0; 1.0],
    x -> [x[1]^2 + x[2]^2; x[1] * x[2]],
    T[25, 9],
    T[25, 9],
    name = "hs8";
    kwargs...,
  )
end
