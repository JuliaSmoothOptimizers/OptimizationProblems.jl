export hs47

function hs47(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1] + x[2]^2 + x[3]^3 - 3
    cx[2] = x[2] - x[3]^2 + x[4] - 1
    cx[3] = x[1] * x[5] - 1
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^3 + (x[3] - x[4])^4 + (x[4] - x[5])^4,
    T[2, sqrt(2), -1, 2 - sqrt(2), 0.5],
    c!,
    zeros(T, 3),
    zeros(T, 3),
    name = "hs47";
    kwargs...,
  )
end
