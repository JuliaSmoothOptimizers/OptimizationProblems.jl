export hs22

function hs22(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 2)^2 + (x[2] - 1)^2
  end
  x0 = 2 * ones(T, 2)
  function c(x)
    n = length(x)
    return [x[1] + x[2], -x[1]^2 + x[2]]
  end
  lcon = [-T(Inf), zero(T)]
  ucon = [2, T(Inf)]
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs22", lin = [1]; kwargs...)
end
