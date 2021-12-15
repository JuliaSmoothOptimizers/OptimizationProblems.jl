export hs51

function hs51(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2,
    T[2.5, 0.5, 2.0, -1.0, 0.5],
    x -> [x[1] + 3 * x[2]; x[3] + x[4] - 2 * x[5]; x[2] - x[5]],
    T[4, 0, 0],
    T[4, 0, 0],
    name = "hs51";
    kwargs...,
  )
end
