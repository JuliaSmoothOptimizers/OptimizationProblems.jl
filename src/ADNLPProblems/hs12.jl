export hs12 
 
function hs12(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 / 2 + x[2]^2 - x[1] * x[2] - 7 * x[1] - 7 * x[2]
  end
  x0 = zeros(T, 2)
  function c(x)
    n = length(x)
    return [4 * x[1]^2 + x[2]^2]
  end
  lcon = -T(Inf) * ones(T, 1)
  ucon = 25 * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs12"; kwargs...)
end
