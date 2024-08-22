export hs83

function hs83(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    Ti = eltype(x)
    return Ti(5.3578547) * x[3]^2 + Ti(0.8356891) * x[1] * x[5] + Ti(37.293239) * x[1] -
           Ti(40792.141)
  end
  x0 = T[78, 33, 27, 27, 27]
  lvar = T[78, 33, 27, 27, 27]
  uvar = T[102, 45, 45, 45, 45]
  a = Rational{Int}[
    85.334407,
    0.0056858,
    0.0006262,
    0.0022053,
    80.51249,
    0.0071317,
    0.0029955,
    0.0021813,
    9.300961,
    0.0047026,
    0.0012547,
    0.0019085,
  ]

  function c!(cx, x, a = a)
    cx[1] = a[2] * x[2] * x[5] + a[3] * x[1] * x[4] - a[4] * x[3] * x[5]
    cx[2] = a[6] * x[2] * x[5] + a[7] * x[1] * x[2] - a[8] * x[3] * x[3]
    cx[3] = a[10] * x[3] * x[5] + a[11] * x[1] * x[3] - a[12] * x[3] * x[4]
    return cx
  end
  lcon = T[-a[1], -a[5] + 90, -a[9] + 20]
  ucon = T[92 - a[1], 20 -a[5] + 90, 5-a[9] + 20]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs83"; kwargs...)
end
