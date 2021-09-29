export hs57

function hs57(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = Array{Int64}(undef, 44)
  a[1:2] .= 8
  a[3:6] .= 10
  a[7:10] .= 12
  a[11:13] .= 14
  a[14:16] .= 16
  a[17:18] .= 18
  a[19:21] .= 20
  a[22:24] .= 22
  a[25:27] .= 24
  a[28:30] .= 26
  a[31:32] .= 28
  a[33:35] .= 30
  a[36:37] .= 32
  a[38] = 34
  a[39:40] .= 36
  a[41:42] .= 38
  a[43] = 40
  a[44] = 42

  b = Array{T}(undef, 44)
  b[1:2] .= 0.49
  b[3] = 0.48
  b[4] = 0.47
  b[5] = 0.48
  b[6] = 0.47
  b[7:8] .= 0.46
  b[9] = 0.45
  b[10] = 0.43
  b[11] = 0.45
  b[12:13] .= 0.43
  b[14] = 0.44
  b[15:16] .= 0.43
  b[17] = 0.46
  b[18] = 0.45
  b[19:20] .= 0.42
  b[21] = 0.43
  b[22:23] .= 0.41
  b[24] = 0.40
  b[25] = 0.42
  b[26:27] .= 0.40
  b[28] = 0.41
  b[29] = 0.40
  b[30:31] .= 0.41
  b[32:34] .= 0.40
  b[35] = 0.38
  b[36] = 0.41
  b[37:38] .= 0.40
  b[39] = 0.41
  b[40] = 0.38
  b[41:42] .= 0.40
  b[43:44] .= 0.39
  function f(x)
    n = length(x)
    return sum([b[i] - x[1] - (T(0.49) - x[1]) * exp(-x[2] * (a[i] - 8)) for i = 1:44] .^ 2)
  end
  x0 = T[0.42, 5]
  lvar = T[0.4, -4]
  uvar = T(Inf) * ones(T, 2)
  function c(x)
    n = length(x)
    return [T(0.49) * x[2] - x[1] * x[2] - T(0.09)]
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs57"; kwargs...)
end
