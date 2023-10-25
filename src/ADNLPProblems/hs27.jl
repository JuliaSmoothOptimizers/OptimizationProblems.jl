export hs27

function hs27(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1] + x[3]^2 + 1
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> 1 // 100 * (x[1] - 1)^2 + (x[2] - x[1]^2)^2,
    2ones(T, 3),
    c!,
    zeros(T, 1),
    zeros(T, 1),
    name = "hs27";
    kwargs...,
  )
end
