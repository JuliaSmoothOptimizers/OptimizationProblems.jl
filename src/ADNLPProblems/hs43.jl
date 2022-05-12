export hs43

function hs43(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^2 + x[2]^2 + 2 * x[3]^2 + x[4]^2 - 5 * x[1] - 5 * x[2] - 21 * x[3] + 7 * x[4]
  end
  x0 = zeros(T, 4)
  function c(x)
    n = length(x)
    return [
      x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[1] - x[2] + x[3] - x[4],
      x[1]^2 + 2 * x[2]^2 + x[3]^2 + 2 * x[4]^2 - x[1] - x[4],
      2 * x[1]^2 + x[2]^2 + x[3]^2 + 2 * x[1] - x[2] - x[4],
    ]
  end
  lcon = -T(Inf) * ones(T, 3)
  ucon = T[8, 10, 5]
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs43"; kwargs...)
end
