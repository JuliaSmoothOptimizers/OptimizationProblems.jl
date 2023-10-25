export hs49

function hs49(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    T[10, 7, 2, -3, 0.8],
    [1; 1; 1; 1; 2; 2],
    [1; 2; 3; 4; 3; 5],
    T[1; 1; 1; 4; 1; 5],
    T[7, 6],
    T[7, 6],
    name = "hs49";
    kwargs...,
  )
end
