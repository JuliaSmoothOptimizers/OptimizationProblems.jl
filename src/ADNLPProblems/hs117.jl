export hs117

function hs117(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  a = Array{Rational{Int}}(undef, 10, 5)
  a[1, :] = [-16, 2, 0, 1, 0]
  a[2, :] = [0, -2, 0, 4, 2]
  a[3, :] = [-35 // 10, 0, 2, 0, 0]
  a[4, :] = [0, -2, 0, -4, -1]
  a[5, :] = [0, -9, -2, 1, -2.8]
  a[6, :] = [2, 0, -4, 0, 0]
  a[7, :] = [-1, -1, -1, -1, -1]
  a[8, :] = [-1, -2, -3, -2, -1]
  a[9, :] = [1, 2, 3, 4, 5]
  a[10, :] = [1, 1, 1, 1, 1]

  b = [-40, -2, -25 // 100, -4, -4, -1, -40, -60, 5, 1]

  ci = Array{Int}(undef, 5, 5)
  ci[1, :] = [30, -20, -10, 32, -10]
  ci[2, :] = [-20, 39, -6, -31, 32]
  ci[3, :] = [-10, -6, 10, -6, -10]
  ci[4, :] = [32, -31, -6, 39, -20]
  ci[5, :] = [-10, 32, -10, -20, 30]

  d = [4, 8, 10, 6, 2]

  e = [-15, -27, -36, -18, -12]
  function f(x; b = b, ci = ci, d = d)
    return -sum(b[j] * x[j] for j = 1:10) +
           sum(sum(ci[k, j] * x[10 + k] * x[10 + j] for k = 1:5) for j = 1:5) +
           2 * sum(d[j] * x[10 + j]^3 for j = 1:5)
  end
  x0 = T(0.001) * [1, 1, 1, 1, 1, 1, 60000, 1, 1, 1, 1, 1, 1, 1, 1]
  lvar = zeros(T, 15)
  uvar = T(Inf) * ones(T, 15)
  function c!(cx, x)
    for j = 1:5
      cx[j] =
        2 * sum(ci[k, j] * x[10 + k] + 3 * d[j] * x[10 + j]^2 for k = 1:5) + e[j] -
        sum(a[k, j] * x[k] for k = 1:10)
    end
    return cx
  end
  lcon = zeros(T, 5)
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs117"; kwargs...)
end
