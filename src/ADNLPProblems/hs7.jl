export hs7

function hs7(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = (1 + x[1]^2)^2 + x[2]^2 - 4
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> log(1 + x[1]^2) - x[2],
    T[2.0; 2.0],
    c!,
    zeros(T, 1),
    zeros(T, 1),
    name = "hs7";
    kwargs...,
  )
end
