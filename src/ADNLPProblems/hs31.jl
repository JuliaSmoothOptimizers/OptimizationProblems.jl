export hs31

function hs31(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 9 * x[1]^2 + x[2]^2 + 9 * x[3]^2
  end
  x0 = ones(T, 3)
  lvar = T[-10, 1, -10]
  uvar = T[10, 10, 1]
  function c(x)
    n = length(x)
    return [x[1] * x[2] - 1]
  end
  lcon = zeros(T, 1)
  ucon = T[Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs31"; kwargs...)
end
