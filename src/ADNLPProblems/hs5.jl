export hs5

function hs5(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = zeros(T, 2)
  f(x) = sin(x[1] + x[2]) + (x[1] - x[2])^2 - 3x[1] / 2 + 5x[2] / 2 + 1
  l = T[-1.5; -3.0]
  u = T[4.0; 3.0]

  return ADNLPModels.ADNLPModel(f, x0, l, u, name = "hs5_autodiff"; kwargs...)
end
