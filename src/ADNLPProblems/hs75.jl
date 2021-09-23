export hs75 
 
function hs75(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = T(0.48)
  function f(x)
    n = length(x)
    return 3 * x[1] + T(1e-6) * x[1]^3 + 2 * x[2] + T(1e-6 * (2 / 3)) * x[2]^3
  end
  x0 = zeros(T, 4)
  lvar = T[0, 0, -a, -a]
  uvar = T[1200, 1200, a, a]
  function c(x)
    n = length(x)
    return [
      x[4] - x[3],
      1000 * sin(-x[3] - 0.25) + 1000 * sin(-x[4] - 0.25) + 894.8 - x[1],
      1000 * sin(x[3] - 0.25) + 1000 * sin(x[3] - x[4] - 0.25) + 894.8 - x[2],
      1000 * sin(x[4] - 0.25) + 1000 * sin(x[4] - x[3] - 0.25) + 1294.8
    ]
  end
  lcon = vcat(-a, zeros(T, 3))
  ucon = vcat(a, zeros(T, 3))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs75"; kwargs...)
end
