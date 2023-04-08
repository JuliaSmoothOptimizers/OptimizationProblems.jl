export hs40

function hs40(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1]^3 + x[2]^2 - 1
    cx[2] = x[4] * x[1]^2 - x[3]
    cx[3] = x[4]^2 - x[2]
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> -x[1] * x[2] * x[3] * x[4],
    T(0.8) * ones(T, 4),
    c!,
    zeros(T, 3),
    zeros(T, 3),
    name = "hs40";
    kwargs...,
  )
end
