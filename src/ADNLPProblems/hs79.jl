export hs79

function hs79(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    Ti = eltype(x)
    cx[1] = x[1] + x[2]^2 + x[3]^3 - 2 - 3 * Ti(sqrt(2))
    cx[2] = x[2] - x[3]^2 + x[4] + 2 - 2 * Ti(sqrt(2))
    cx[3] = x[1] * x[5] - 2
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^4,
    2 * ones(T, 5),
    c!,
    zeros(T, 3),
    zeros(T, 3),
    name = "hs79";
    kwargs...,
  )
end
