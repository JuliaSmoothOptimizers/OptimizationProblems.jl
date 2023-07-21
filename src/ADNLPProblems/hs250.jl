export hs250

function hs250(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -x[1] * x[2] * x[3]
  end
  x0 = T[10, 10, 10]
  lvar = T[0, 0, 0]
  uvar = T[20, 11, 42]
  A = T[
    1 2 2
    -1 -2 -2
  ]
  lcon = T[0; -72]
  ucon = T[Inf; Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs250"; kwargs...)
end
