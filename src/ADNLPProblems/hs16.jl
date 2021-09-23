export hs16 
 
function hs16(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[-2, 1]
  lvar = T[-0.5, -Inf]
  uvar = T[0.5, 1]
  function c(x)
    n = length(x)
    return [x[1]^2 + x[2], x[1] + x[2]^2]
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs16"; kwargs...)
end
