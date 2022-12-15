export aircrfta

function aircrfta(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}


  function f(x)
    return zero(eltype(x))
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
      (-(3933 // 1000)*rollrate+(107 // 1000)*pitchrat+(126 // 1000)*yawrate-(999 // 100)*sslipang-(4583 // 100)*aileron-(764 // 100)*rudderdf-(727 // 1000)*pitchrat*yawrate+
      (839 // 100)*yawrate*attckang-(6844 // 10)*attckang*sslipang+(635 // 10)*pitchrat*attckang),
      (-(987 // 1000)*pitchrat-(2295 // 100)*attckang-(2837 // 100)*elevator+(949 // 1000)*rollrate*yawrate+(173 // 1000)*rollrate*sslipang),
      ((2 // 1000)*rollrate-(235 // 1000)*yawrate+(567 // 100)*sslipang-(921 // 1000)*aileron-(651 // 100)*rudderdf-(716 // 1000)*rollrate*pitchrat-(1578 // 1000)*rollrate*attckang+(1132 // 1000)*pitchrat*attckang),
      (pitchrat- attckang-(1168 // 1000)*elevator-rollrate*sslipang),
      (-yawrate-(196 // 1000)*sslipang-(71 // 10000)*aileron+rollrate*attckang)
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, zeros(T, 5), zeros(T, 5), name = "aircrfta", minimize = true; kwargs...)
end
