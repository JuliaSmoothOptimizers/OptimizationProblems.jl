export hs265

function hs265(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(1 - exp(-10 * x[i] * exp(-x[i + 2])) for i=1:2)
  end
  x0 = T[0, 0, 0, 0]
  lvar = T[0, 0, 0, 0]
  uvar = T[1, 1, 1, 1]
  A = T[
    1 1 0 0
    0 0 1 1
  ]
  lcon = ucon = T[1; 1]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs265"; kwargs...)
end
