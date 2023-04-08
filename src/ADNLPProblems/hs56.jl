export hs56

function hs56(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function c!(cx, x)
    cx[1] = x[1] - 42 // 10 * sin(x[4])^2
    cx[2] = x[2] - 42 // 10 * sin(x[5])^2
    cx[3] = x[3] - 42 // 10 * sin(x[6])^2
    cx[4] = x[1] + 2 * x[2] + 2 * x[3] - 72 // 10 * sin(x[7])^2
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> -x[1] * x[2] * x[3],
    T[
      1.0,
      1.0,
      1.0,
      asin(sqrt(1 / 4.2)),
      asin(sqrt(1 / 4.2)),
      asin(sqrt(1 / 4.2)),
      asin(sqrt(5 / 7.2)),
    ],
    c!,
    zeros(T, 4),
    zeros(T, 4),
    name = "hs56";
    kwargs...,
  )
end
