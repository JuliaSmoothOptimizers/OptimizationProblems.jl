export hs253

function hs253(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  c = ones(Int, 8)
  a1 = [0; 10; 10; 0; 0; 10; 10; 0]
  a2 = [0; 0; 10; 10; 0; 0; 10; 10]
  a3 = [0; 0; 0; 0; 10; 10; 10; 10]

  function f(x)
    n = length(x)
    return sum(c[j] * sqrt((a1[j] - x[1]^2 + (a2[j] - x[2])^2 + (a3[j] - x[3])^2)) for j = 1:8)
  end
  x0 = T[0, 2, 0]
  lvar = T[0, 0, 0]
  uvar = T[Inf, Inf, Inf]
  A = T[
    -3 0 -3
  ]
  lcon = T[-30]
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs253"; kwargs...)
end
