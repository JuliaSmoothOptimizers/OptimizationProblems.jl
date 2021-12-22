export hs55

function hs55(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1] + 2 * x[2] + 4 * x[5] + exp(x[1] * x[4])
  end
  x0 = T[1, 2, 0, 0, 0, 2]
  uvar = T[1, Inf, Inf, 1, Inf, Inf]
  lvar = zeros(T, 6)
  function c(x)
    n = length(x)
    return [
      x[1] + 2 * x[2] + 5 * x[5],
      x[1] + x[2] + x[3],
      x[4] + x[5] + x[6],
      x[1] + x[4],
      x[2] + x[5],
      x[3] + x[6],
    ]
  end
  lcon = T[6, 3, 2, 1, 2, 2]
  ucon = T[6, 3, 2, 1, 2, 2]
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    lcon,
    ucon,
    name = "hs55",
    lin = 1:6;
    kwargs...,
  )
end
