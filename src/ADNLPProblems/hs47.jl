export hs47

function hs47(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    cx[3] = x[1] + x[2]^2 + x[3]^3
    cx[2] = x[2] - x[3]^2 + x[4]
    cx[1] = x[1] * x[5]
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^3 + (x[3] - x[4])^4 + (x[4] - x[5])^4,
    T[2, sqrt(2), -1, 2 - sqrt(2), 0.5],
    c!,
    T[1; 1; 0],
    T[1; 1; 0],
    name = "hs47";
    kwargs...,
  )
end
