export hs69

function hs69(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a1 = 1 // 10
  b1 = 1000
  d1 = 1
  n1 = 4
  
  function f(x)
    return (a1 * n1 - (b1 * (exp(x[1] - 1) - x[3])) / (exp(x[1] -1 + x[4])) * x[4]) / x[1]
  end
  x0 = ones(T, 4)
  uvar = T[100, 100, 2, 2]
  lvar = T[1 // 10000, 0, 0, 0]

  function c(x)
    phi(t) = 1 // 2 * (erf(t / sqrt(2)) + 1)
    return [
      x[3] - 2 * phi(x[2]);
      x[4] - phi(-x[2] + d1 * sqrt(n1)) - phi(-x[2] - d1 * sqrt(n1))
    ]
  end
  lcon = zeros(T, 2)
  ucon = zeros(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs69"; kwargs...)
end


