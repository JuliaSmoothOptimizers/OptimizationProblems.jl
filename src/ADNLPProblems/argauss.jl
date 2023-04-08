export argauss

function argauss(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  xinit = T[
    0.4
    1.0
    0.0
  ]
  rhs = T[
    0.0009
    0.0044
    0.0175
    0.0540
    0.1295
    0.2420
    0.3521
    0.3989
    0.3521
    0.2420
    0.1295
    0.0540
    0.0175
    0.0044
    0.0009
  ]

  function f(x)
    return zero(eltype(x))
  end
  x0 = xinit
  lvar = -T(Inf) * ones(T, 3)
  uvar = T(Inf) * ones(T, 3)

  function c!(cx, x; rhs = rhs)
    for i = 1:15
      cx[i] = x[1] * exp(-1 // 2 * x[2] * (1 // 2 * (8 - i) - x[3])^2) - rhs[i]
    end
    return cx
  end

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    c!,
    zeros(T, 15),
    zeros(T, 15),
    name = "argauss",
    minimize = true;
    kwargs...,
  )
end
