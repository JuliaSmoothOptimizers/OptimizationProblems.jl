export aircrfta

function aircrfta(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}


  function f(x)
    return zero(T)
  end
  x0 = T[
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ]
  lvar = T[
    -Inf,
    -Inf,
    -Inf,
    -Inf,
    -Inf,
    0.1,
    0.0,
    0.0,
  ]
  uvar = T[
    Inf,
    Inf,
    Inf,
    Inf,
    Inf,
    0.1,
    0.0,
    0.0,
  ]

  function c(x)
    rollrate, pitchrat, yawrate, attckang, sslipang, elevator, aileron, rudderdf = x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8]
    return vcat(
      (-T(3.933)*rollrate+T(0.107)*pitchrat+T(0.126)*yawrate-T(9.99)*sslipang-T(45.83)*aileron-T(7.64)*rudderdf-T(0.727)*pitchrat*yawrate+
      T(8.39)*yawrate*attckang-T(684.4)*attckang*sslipang+T(63.5)*pitchrat*attckang),
      (-T(0.987)*pitchrat-T(22.95)*attckang-T(28.37)*elevator+T(0.949)*rollrate*yawrate+T(0.173)*rollrate*sslipang),
      (T(0.002)*rollrate-T(0.235)*yawrate+T(5.67)*sslipang-T(0.921)*aileron-T(6.51)*rudderdf-T(0.716)*rollrate*pitchrat-T(1.578)*rollrate*attckang+T(1.132)*pitchrat*attckang),
      (pitchrat- attckang-T(1.168)*elevator-rollrate*sslipang),
      (-yawrate-T(0.196)*sslipang-T(0.0071)*aileron+rollrate*attckang)
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, zeros(T, 5), zeros(T, 5), name = "aircrfta", minimize = true; kwargs...)
end
