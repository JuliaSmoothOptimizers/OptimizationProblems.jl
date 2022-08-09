export hs28

function hs28(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] + x[2])^2 + (x[2] + x[3])^2,
    T[-4.0, 1.0, 1.0],
    [1; 1; 1],
    [1; 2; 3],
    T[1; 2; 3],
    ones(T, 1),
    ones(T, 1),
    name = "hs28";
    kwargs...,
  )
end
