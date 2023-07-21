export hs257

function hs257(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 +
           (1 - x[1])^2 +
           90 * (x[3]^2 - x[4])^2 +
           (x[3] - 1)^2 +
           101 // 10 * (x[2] - 1)^2 +
           101 // 10 * (x[4] - 1)^2 +
           198 // 10 * (x[1] - 1) * (x[4] - 1)
  end
  x0 = T[-3, -1, -3, -1]
  lvar = T[0, -Inf, 0, -Inf]
  uvar = T[Inf, Inf, Inf, Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs257"; kwargs...)
end
