export Shpak5

function Shpak5(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  veca = T[3.040 1.098 0.674 3.537 6.173 8.679 4.503 3.328 6.937 0.700]
  veck = T[2.983 2.378 2.439 1.168 2.406 1.236 2.868 1.378 2.348 2.268]
  vecc = T[0.192 0.140 0.127 0.132 0.125 0.189 0.187 0.171 0.188 0.176]
  function f(x)
    n = length(x)
    return -sum(1 / (veck[i]^2 * (x[1] - veca[i])^2 + vecc[i]) for i = 1:10)
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak5"; kwargs...)
end
