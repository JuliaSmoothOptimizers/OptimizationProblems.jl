export hs63

function hs63(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 + x[3]^2 - 25
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> 1000 - x[1]^2 - 2 * x[2]^2 - x[3]^2 - x[1] * x[2] - x[1] * x[3],
    2 * ones(T, 3),
    zeros(T, 3),
    T(Inf) * ones(T, 3),
    [1; 1; 1],
    [1; 2; 3],
    T[8; 14; 7],
    c!,
    T[56, 0],
    T[56, 0],
    name = "hs63";
    kwargs...,
  )
end
