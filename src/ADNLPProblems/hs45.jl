export hs45

function hs45(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 2 - x[1] * x[2] * x[3] * x[4] * x[5] / 120
  end
  x0 = 2 * ones(T, 5)
  lvar = zeros(T, 5)
  uvar = T[1, 2, 3, 4, 5]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs45"; kwargs...)
end
