export alsotame

function alsotame(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    x, y = x[1], x[2]
    return exp(x - 2 * y)
  end
  x0 = T[0.0, 0.0]
  lvar = T[-Inf, -Inf]
  uvar = T[Inf, Inf]

  function c!(cx, x)
    x, y = x[1], x[2]
    cx[1] = sin(-x + y - 1)
    return cx
  end
  A = T[
    1 0 0
    0 1 0
  ]

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    findnz(sparse(A))...,
    c!,
    T[-2, -1.5, 0],
    T[2, 1.5, 0],
    name = "alsotame",
    minimize = true;
    kwargs...,
  )
end
