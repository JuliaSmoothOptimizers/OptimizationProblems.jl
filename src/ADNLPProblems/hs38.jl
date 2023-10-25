export hs38

function hs38(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 +
           (1 - x[1])^2 +
           90 * (x[4] - x[3]^2)^2 +
           (1 - x[3])^2 +
           101 // 10 * ((x[2] - 1)^2 + (x[4] - 1)^2) +
           198 // 10 * (x[2] - 1) * (x[4] - 1)
  end
  x0 = T[-3, -1, -3, -1]
  lvar = -10 * ones(T, 4)
  uvar = 10 * ones(T, 4)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs38"; kwargs...)
end
