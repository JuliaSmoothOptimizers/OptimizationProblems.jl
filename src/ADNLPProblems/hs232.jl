export hs232

function hs232(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x::AbstractVector{Ti}) where {Ti}
    return -(9 - (x[1] - 3)^2) * x[2]^3 / Ti(27 * sqrt(3))
  end
  x0 = T[2, 0.5]
  lvar = T[0, 0]
  uvar = T[Inf, Inf]
  A = T[
    1/sqrt(3) -1
    1 sqrt(3)
    -1 -sqrt(3)
  ]
  lcon = T[0; 0; -6]
  ucon = T[Inf; Inf; Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, sparse(A), lcon, ucon, name = "hs232"; kwargs...)
end
