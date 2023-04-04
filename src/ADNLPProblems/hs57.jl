export hs57

function hs57(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs57(Val(model); kwargs...)
end

function hs57(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
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

  b = Array{Rational{Int}}(undef, 44)
  b[1:2] .= 49 // 100
  b[3] = 48 // 100
  b[4] = 47 // 100
  b[5] = 48 // 100
  b[6] = 47 // 100
  b[7:8] .= 46 // 100
  b[9] = 45 // 100
  b[10] = 43 // 100
  b[11] = 45 // 100
  b[12:13] .= 43 // 100
  b[14] = 44 // 100
  b[15:16] .= 43 // 100
  b[17] = 46 // 100
  b[18] = 45 // 100
  b[19:20] .= 42 // 100
  b[21] = 43 // 100
  b[22:23] .= 41 // 100
  b[24] = 40 // 100
  b[25] = 42 // 100
  b[26:27] .= 40 // 100
  b[28] = 41 // 100
  b[29] = 40 // 100
  b[30:31] .= 41 // 100
  b[32:34] .= 40 // 100
  b[35] = 38 // 100
  b[36] = 41 // 100
  b[37:38] .= 40 // 100
  b[39] = 41 // 100
  b[40] = 38 // 100
  b[41:42] .= 40 // 100
  b[43:44] .= 39 // 100
  function f(x; a = a, b = b)
    return 1 // 2 * sum((b[i] - x[1] - (49 // 100 - x[1]) * exp(-x[2] * (a[i] - 8)))^2 for i = 1:44)
  end
  x0 = T[0.42, 5]
  lvar = T[0.4, -4]
  uvar = T(Inf) * ones(T, 2)
  function c(x)
    n = length(x)
    return [49 // 100 * x[2] - x[1] * x[2] - 9 // 100]
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs57"; kwargs...)
end

function hs57(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
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

  b = Array{Rational{Int}}(undef, 44)
  b[1:2] .= 49 // 100
  b[3] = 48 // 100
  b[4] = 47 // 100
  b[5] = 48 // 100
  b[6] = 47 // 100
  b[7:8] .= 46 // 100
  b[9] = 45 // 100
  b[10] = 43 // 100
  b[11] = 45 // 100
  b[12:13] .= 43 // 100
  b[14] = 44 // 100
  b[15:16] .= 43 // 100
  b[17] = 46 // 100
  b[18] = 45 // 100
  b[19:20] .= 42 // 100
  b[21] = 43 // 100
  b[22:23] .= 41 // 100
  b[24] = 40 // 100
  b[25] = 42 // 100
  b[26:27] .= 40 // 100
  b[28] = 41 // 100
  b[29] = 40 // 100
  b[30:31] .= 41 // 100
  b[32:34] .= 40 // 100
  b[35] = 38 // 100
  b[36] = 41 // 100
  b[37:38] .= 40 // 100
  b[39] = 41 // 100
  b[40] = 38 // 100
  b[41:42] .= 40 // 100
  b[43:44] .= 39 // 100

  function F!(r, x; a = a, b = b)
    for i=1:44
      r[i] = b[i] - x[1] - (49 // 100 - x[1]) * exp(-x[2] * (a[i] - 8))
    end
    return r
  end
  x0 = T[0.42, 5]
  lvar = T[0.4, -4]
  uvar = T(Inf) * ones(T, 2)
  function c!(cx, x)
    cx[1] = 49 // 100 * x[2] - x[1] * x[2] - 9 // 100
    return cx
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLSModel!(F!, x0, 44, lvar, uvar, c!, lcon, ucon, name = "hs57-nls"; kwargs...)
end
