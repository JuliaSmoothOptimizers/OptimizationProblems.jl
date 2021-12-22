export hs14

function hs14(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[2; 2]
  f(x) = (x[1] - 2)^2 + (x[2] - 1)^2
  c(x) = T[x[1] - 2 * x[2]; x[1]^2 / 4 + x[2]^2 - 1]
  lcon = T[-1; -Inf]
  ucon = T[-1; 0]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs14", lin = [1]; kwargs...)
end
