export hs113

function hs113(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]^2 + x[1] * x[2] - 14 * x[1] - 16 * x[2] +
           (x[3] - 10)^2 +
           4 * (x[4] - 5)^2 +
           (x[5] - 3)^2 +
           2 * (x[6] - 1)^2 +
           5 * x[7]^2 +
           7 * (x[8] - 11)^2 +
           2 * (x[9] - 10)^2 +
           (x[10] - 7)^2 +
           45
  end
  x0 = T[2, 3, 5, 5, 1, 2, 7, 3, 6, 10]
  function c(x)
    n = length(x)
    return [
      -4 * x[1] - 5 * x[2] + 3 * x[7] - 9 * x[8],
      -10 * x[1] + 8 * x[2] + 17 * x[7] - 2 * x[8],
      8 * x[1] - 2 * x[2] - 5 * x[9] + 2 * x[10],
      -3 * (x[1] - 2)^2 - 4 * (x[2] - 3)^2 - 2 * x[3]^2 + 7 * x[4] + 120,
      -5 * x[1]^2 - 8 * x[2] - (x[3] - 6)^2 + 2 * x[4] + 40,
      -0.5 * (x[1] - 8)^2 - 2 * (x[2] - 4)^2 - 3 * x[5]^2 + x[6] + 30,
      -x[1]^2 - 2 * (x[2] - 2)^2 + 2 * x[1] * x[2] - 14 * x[5] + 6 * x[6],
      3 * x[1] - 6 * x[2] - 12 * (x[9] - 8)^2 + 7 * x[10],
    ]
  end
  lcon = vcat(-105, 0, -12, zeros(T, 5))
  ucon = T(Inf) * ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs113"; kwargs...)
end
