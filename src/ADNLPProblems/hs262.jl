export hs262

function hs262(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return - 1 // 2 * x[1] - x[2] - 1 // 2 * x[3] - x[4]
  end
  x0 = T[1, 1, 1, 1]
  lvar = T[0, 0, 0, 0]
  uvar = T[Inf, Inf, Inf, Inf]
  A = T[
    1 1 1 -2
    -1 -1 -1 -1
    -2//10 -5//10 -1 -2
    -2 -1 -5//10 -2//10
  ]
  lcon = T[6; -10; -10; -10]
  ucon = T[6; Inf; Inf; Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs262"; kwargs...)
end
