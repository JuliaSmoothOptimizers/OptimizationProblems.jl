export hs118 
 
function hs118(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[20, 55, 15, 20, 60, 20, 20, 60, 20, 20, 60, 20, 20, 60, 20]
  lvar = T[8, 43, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  uvar = T[21, 57, 16, 90, 120, 60, 90, 120, 60, 90, 120, 60, 90, 120, 60]

  a = T(50.176)
  b = T(sin(0.25))
  c = T(cos(0.25))
  function f(x)
    n = length(x)
    return sum(
      T(2.3) * x[3 * k + 1] +
      T(0.0001) * x[3 * k + 1]^2 +
      T(1.7) * x[3 * k + 2] +
      T(0.0001) * x[3 * k + 2]^2 +
      T(2.2) * x[3 * k + 3] +
      T(0.00015) * x[3 * k + 3]^2 for k = 0:4
    )
  end
  function c(x)
    n = length(x)
    return vcat(
      x[1] + x[2] + x[3],
      x[4] + x[5] + x[6],
      x[7] + x[8] + x[9],
      x[10] + x[11] + x[12],
      x[13] + x[14] + x[15],
      reduce(vcat, [[x[3 * j + 1] - x[3 * j - 2], x[3 * j + 2] - x[3 * j - 1], x[3 * j + 3] - x[3 * j]] for j=1:4]),
    )
  end
  lcon = T[60, 70, 100, 50, 85, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7, -7]
  ucon = vcat(T(Inf) * ones(T, 5), T[6, 6, 7, 6, 6, 7, 6, 6, 7, 6, 6, 7])
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs118"; kwargs...)
end
