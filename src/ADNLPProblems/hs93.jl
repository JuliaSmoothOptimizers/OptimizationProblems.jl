export hs93 
 
function hs93(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return T(0.0204) * x[1] * x[4] * (x[1] + x[2] + x[3]) +
    T(0.0187) * x[2] * x[3] * (x[1] + T(1.57) * x[2] + x[4]) +
    T(0.0607) * x[1] * x[4] * x[5]^2 * (x[1] + x[2] + x[3]) +
    T(0.0437) * x[2] * x[3] * x[6]^2 * (x[1] + T(1.57) * x[2] + x[4])
  end
  x0 = T[5.54, 4.4, 12.02, 11.82, 0.702, 0.852]
  lvar = zeros(T, 6)
  uvar = T(Inf) * ones(T, 6)
  function c(x)
    n = length(x)
    return [
      0.001 * prod(x[i] for i = 1:6) - 2.07,
      1 - 0.00062 * x[1] * x[4] * x[5]^2 * (x[1] + x[2] + x[3]) -
      0.00058 * x[2] * x[3] * x[6]^2 * (x[1] + 1.57 * x[2] + x[4])
    ]
  end
  lcon = zeros(T, 2)
  ucon = T(Inf) * ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs93"; kwargs...)
end
