export hs231

function hs231(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[-1.2, 1]
  A = T[
    1 // 3 1
    - 1 // 3 1
  ]
  lcon = T[-0.1; -0.1]
  ucon = T[Inf; Inf]
  return ADNLPModels.ADNLPModel(f, x0, sparse(A), lcon, ucon, name = "hs231"; kwargs...)
end
