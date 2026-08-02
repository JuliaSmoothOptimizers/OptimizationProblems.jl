export dembo_gp5

function dembo_gp5(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  c = T[
    1.0,
    1.0,
    1.0,
    833.33252,
    100.0,
    -83333.333,
    1250.0,
    1.0,
    -1250.0,
    1250000.0,
    1.0,
    -2500.0,
    0.0025,
    0.0025,
    0.0025,
    0.0025,
    -0.0025,
    0.01,
    -0.01,
  ]

  function f(x)
    return c[1] * x[1] + c[2] * x[2] + c[3] * x[3]
  end

  function c!(cx, x)
    cx[1] = c[4] * x[4] / (x[1] * x[6]) + c[5] / x[6] + c[6] / (x[1] * x[6])
    cx[2] = c[7] * x[5] / (x[2] * x[7]) + c[8] * x[4] / x[7] + c[9] * x[4] / (x[2] * x[7])
    cx[3] = c[10] / (x[3] * x[8]) + c[11] * x[5] / x[8] + c[12] * x[5] / (x[3] * x[8])
    cx[4] = c[13] * x[4] + c[14] * x[6]
    cx[5] = c[15] * x[5] + c[16] * x[7] + c[17] * x[4]
    cx[6] = c[18] * x[8] + c[19] * x[5]
    return cx
  end

  x0 = T[5000.0, 5000.0, 5000.0, 200.0, 350.0, 150.0, 225.0, 425.0]
  lvar = T[100.0, 1000.0, 1000.0, 10.0, 10.0, 10.0, 10.0, 10.0]
  uvar = T[10000.0, 10000.0, 10000.0, 1000.0, 1000.0, 1000.0, 1000.0, 1000.0]
  lcon = fill(T(-Inf), 6)
  ucon = fill(T(0), 6)

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    c!,
    lcon,
    ucon,
    name = "dembo_gp5";
    kwargs...,
  )
end
