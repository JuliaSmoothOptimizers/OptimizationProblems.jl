export hs78 
 
function hs78(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return prod(x[i] for i = 1:5)
  end
  x0 = T[-2, 1.5, 2, -1, -1]
  function c(x)
    n = length(x)
    return [
      sum(x[i]^2 for i = 1:5) - 10,
      x[2] * x[3] - 5 * x[4] * x[5],
      x[1]^3 + x[2]^3 + 1
    ]
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs78"; kwargs...)
end
