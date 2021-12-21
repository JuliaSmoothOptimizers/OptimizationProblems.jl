export hs86

function hs86(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = Array{T}(undef, 10, 5)
  a[1, :] = [-16, 2, 0, 1, 0]
  a[2, :] = [0, -2, 0, 4, 2]
  a[3, :] = [-3.5, 0, 2, 0, 0]
  a[4, :] = [0, -2, 0, -4, -1]
  a[5, :] = [0, -9, -2, 1, -2.8]
  a[6, :] = [2, 0, -4, 0, 0]
  a[7, :] = [-1, -1, -1, -1, -1]
  a[8, :] = [-1, -2, -3, -2, -1]
  a[9, :] = [1, 2, 3, 4, 5]
  a[10, :] = [1, 1, 1, 1, 1]

  b = [-40, -2, -0.25, -4, -4, -1, -40, -60, 5, 1]

  ci = Array{T}(undef, 5, 5)
  ci[1, :] = [30, -20, -10, 32, -10]
  ci[2, :] = [-20, 39, -6, -31, 32]
  ci[3, :] = [-10, -6, 10, -6, -10]
  ci[4, :] = [32, -31, -6, 39, -20]
  ci[5, :] = [-10, 32, -10, -20, 30]

  d = [4, 8, 10, 6, 2]

  e = [-15, -27, -36, -18, -12]
  function f(x)
    n = length(x)
    return sum(e[j] * x[j] for j = 1:5) +
           sum(sum(ci[i, j] * x[i] * x[j] for j = 1:5) for i = 1:5) +
           sum(d[j] * x[j]^3 for j = 1:5)
  end
  x0 = T[0, 0, 0, 0, 1]
  lvar = zeros(T, 5)
  uvar = T(Inf) * ones(T, 5)
  function c(x)
    n = length(x)
    return [sum(a[i, j] * x[j] for j = 1:5) for i = 1:10]
  end
  lcon = T[-40, -2, -0.25, -4, -4, -1, -40, -60, 5, 1]
  ucon = T(Inf) * ones(T, 10)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs86", lin = 1:10; kwargs...)
end
