export linsv

function linsv(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = zeros(T, 2)
  f(x) = x[1]
  con(x) = [x[1] + x[2]; x[2]]
  lcon = T[3; 1]
  ucon = T[Inf; Inf]

  return ADNLPModels.ADNLPModel(f, x0, con, lcon, ucon, name = "linsv", lin = [1, 2]; kwargs...)
end
