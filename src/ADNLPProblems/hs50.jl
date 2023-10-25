export hs50

function hs50(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^2,
    T[35, -31, 11, 5, -5],
    [1; 1; 1; 2; 2; 2; 3; 3; 3],
    [1; 2; 3; 2; 3; 4; 3; 4; 5],
    T[1; 2; 3; 1; 2; 3; 1; 2; 3],
    6 * ones(T, 3),
    6 * ones(T, 3),
    name = "hs50";
    kwargs...,
  )
end
