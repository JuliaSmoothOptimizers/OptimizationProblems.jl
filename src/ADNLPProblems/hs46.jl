export hs46

function hs46(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    cx[1] = (x[1]^2) * x[4] + sin(x[4] - x[5]) - 1
    cx[2] = x[2] + (x[3]^4) * (x[4]^2) - 2
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    T[sqrt(2) / 2, 1.75, 0.5, 2, 2],
    c!,
    zeros(T, 2),
    zeros(T, 2),
    name = "hs46";
    kwargs...,
  )
end
