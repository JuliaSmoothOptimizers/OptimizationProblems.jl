export hs77

function hs77(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1]^2 * x[4] + sin(x[4] - x[5]) - 2 * sqrt(2)
    cx[2] = x[2] + x[3]^4 * x[4]^2 - 8 - sqrt(2)
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    2 * ones(T, 5),
    c!,
    zeros(T, 2),
    zeros(T, 2),
    name = "hs77";
    kwargs...,
  )
end
