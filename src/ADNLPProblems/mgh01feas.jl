export mgh01feas

function mgh01feas(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[-1.2; 1.0]
  f(x) = zero(T)
  c(x) = T[1 - x[1]; 10 * (x[2] - x[1]^2)]
  lcon = zeros(T, 2)
  ucon = zeros(T, 2)

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "mgh01feas"; kwargs...)
end
