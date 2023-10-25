export hs62

function hs62(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -32174 // 1000 * (
      255 * log((x[1] + x[2] + x[3] + 3 // 100) / (9 // 100 * x[1] + x[2] + x[3] + 3 // 100)) +
      280 * log((x[2] + x[3] + 3 // 100) / (7 // 100 * x[2] + x[3] + 3 // 100)) +
      290 * log((x[3] + 3 // 100) / (13 // 100 * x[3] + 3 // 100))
    )
  end
  x0 = T[0.7, 0.2, 0.1]
  lvar = zeros(T, 3)
  uvar = ones(T, 3)
  lcon = ones(T, 1)
  ucon = ones(T, 1)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1; 1],
    [1; 2; 3],
    T[1; 1; 1],
    lcon,
    ucon,
    name = "hs62";
    kwargs...,
  )
end
