export hs236

function hs236(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  B = [
    75.1963666677
    -3.8112755343
    0.1269366345
    -0.0020567665
    0.0000103450
    -6.8306567613
    0.0302344793
    -0.0012813448
    0.0000352559
    -0.0000002266
    0.2564581253
    -0.0034604030
    0.0000135139
    28.1064434908
    -0.0000052375
    -0.0000000063
    0.0000000007
    0.0003405462
    -0.0000016638
    -2.8673112392
  ]
  function f(x::AbstractVector{Ti}; B = Ti.(B)) where {Ti}
    return B[1] +
           B[2] * x[1] +
           B[3] * x[1]^2 +
           B[4] * x[1]^3 +
           B[5] * x[1]^4 +
           B[6] * x[2] +
           B[7] * x[1] * x[2] +
           B[8] * x[1]^2 * x[2] +
           B[9] * x[1]^3 * x[2] +
           B[10] * x[1]^4 * x[2] +
           B[11] * x[2]^2 +
           B[12] * x[2]^3 +
           B[13] * x[2]^4 +
           B[14] * (1 / (1 + x[2])) +
           B[15] * x[1]^2 * x[2]^2 +
           B[16] * x[1]^3 * x[2]^2 +
           B[17] * x[1]^3 * x[2]^3 +
           B[18] * x[1] * x[2]^2 +
           B[19] * x[1] * x[2]^3 +
           B[20] * exp(5 // 10000 * x[1] * x[2])
  end
  x0 = T[90, 10]
  lvar = T[0, 0]
  uvar = T[75, 65]
  function c!(cx, x)
    cx[1] = x[1] * x[2] - 700
    cx[2] = x[2] - 5 * (x[1] / 25)^2
    return cx
  end
  lcon = zeros(T, 2)
  ucon = T[Inf; Inf]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs236"; kwargs...)
end
