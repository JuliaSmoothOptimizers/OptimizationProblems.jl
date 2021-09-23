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
      vcat(
        [x[3 * j + 1] - x[3 * j - 2] + 7 for j=1:4],
        [x[3 * j + 2] - x[3 * j - 1] + 7 for j=1:4],
        [x[3 * j + 3] - x[3 * j] + 7 for j=1:4],
      ),
      x[1] + x[2] + x[3] - 60,
      x[4] + x[5] + x[6] - 70,
      x[7] + x[8] + x[9] - 100,
      x[10] + x[11] + x[12] - 50,
      x[13] + x[14] + x[15] - 85
    )
  end
  lcon = zeros(T, 17)
  ucon = vcat(T[13, 13, 14, 13, 13, 14, 13, 13, 14, 13, 13, 14], T(Inf) * ones(T, 5))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs118"; kwargs...)
end
