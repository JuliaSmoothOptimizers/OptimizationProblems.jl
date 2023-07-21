export hs224

function hs224(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2 * x[1]^2 + x[2]^2 - 48 * x[1] - 40 * x[2]
  end
  x0 = T[0.1, 0.1]
  lvar = T[0, 0]
  uvar = T[6, 6]
  lcon = T[0; -18; 0; -8]
  ucon = T(Inf) * ones(T, 4)
  A = T[
    1 3;
    -1 -3;
    1 1;
    -1 -1
  ]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs224"; kwargs...)
end
