export hs52

function hs52(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (4 * x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2,
    2 * ones(T, 5),
    [1; 1; 2; 2; 2; 3; 3],
    [1; 2; 3; 4; 5; 2; 5],
    T[1; 3; 1; 1; -2; 1; -1],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs52";
    kwargs...,
  )
end
