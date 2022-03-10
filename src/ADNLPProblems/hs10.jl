export hs10

function hs10(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[-10; 10]
  f(x) = x[1] - x[2]
  c(x) = [-3 * x[1]^2 + 2 * x[1] * x[2] - x[2]^2 + 1]
  lcon = T[0.0]
  ucon = T[Inf]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs10"; kwargs...)
end
