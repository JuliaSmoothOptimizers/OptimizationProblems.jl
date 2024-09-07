export hs37

function hs37(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1] * x[2] * x[3]
  end
  x0 = 10 * ones(T, 3)
  lvar = zeros(T, 3)
  uvar = 42 * ones(T, 3)
  function c!(cx, x)
    cx[1] = x[1] + 2 * x[2] + 2 * x[3]
    return cx
  end
  lcon = zeros(T, 1)
  ucon = T[72]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1],
    [1; 2; 3],
    T[1; 2; 2],
    lcon,
    ucon,
    name = "hs37";
    kwargs...,
  )
end
