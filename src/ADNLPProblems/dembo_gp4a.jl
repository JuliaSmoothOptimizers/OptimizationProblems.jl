export dembo_gp4a

function dembo_gp4a(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return T(0.4) * x[1]^T(0.67) * x[7]^T(0.67) + T(0.4) * x[2]^T(0.67) * x[8]^T(0.67) + T(10) - x[1] - x[2]
  end

  function c!(cx, x)
    cx[1] = T(0.0588) * x[5] * x[7] + T(0.1) * x[1]
    cx[2] = T(0.0588) * x[6] * x[8] + T(0.1) * x[1] + T(0.1) * x[2]
    cx[3] = T(4) * x[3] / x[5] + T(2) * x[3]^T(0.71) / x[5] + T(0.0588) * x[3]^T(1.3) * x[7]
    cx[4] = T(4) * x[4] / x[6] + T(2) * x[4]^T(0.71) / x[6] + T(0.0588) * x[4]^T(1.3) * x[8]
    return cx
  end

  x0 = T[6.0, 3.0, 0.4, 0.2, 6.0, 6.0, 1.0, 0.5]
  lvar = fill(T(0.1), 8)
  uvar = fill(T(10), 8)
  lcon = fill(T(-Inf), 4)
  ucon = fill(T(0), 4)

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    c!,
    lcon,
    ucon,
    name = "dembo_gp4a";
    kwargs...,
  )
end
