export hs8

function hs8(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2
    cx[2] = x[1] * x[2]
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> -one(eltype(x)),
    T[2.0; 1.0],
    c!,
    T[25; 9],
    T[25; 9],
    name = "hs8";
    kwargs...,
  )
end
