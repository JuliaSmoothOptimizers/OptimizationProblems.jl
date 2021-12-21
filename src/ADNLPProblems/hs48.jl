export hs48

function hs48(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - 1)^2 + (x[2] - x[3])^2 + (x[4] - x[5])^2,
    T[3, 5, -3, 2, -2],
    x -> [x[1] + x[2] + x[3] + x[4] + x[5]; x[3] - 2 * (x[4] + x[5])],
    T[5, -3],
    T[5, -3],
    name = "hs48",
    lin = [1, 2];
    kwargs...,
  )
end
