export Shpak6 
 
function Shpak6(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  veca = T[4.696 4.885 0.800 4.986 3.901 2.395 0.945 8.371 6.181 5.713]
  veck = T[2.871 2.328 1.111 1.263 2.399 2.629 2.853 2.344 2.592 2.929]
  vecc = T[0.149 0.166 0.175 0.183 0.128 0.117 0.115 0.148 0.188 0.198]
  function f(x)
    n = length(x)
    return -sum(1 / (veck[i]^2 * (x[1] - veca[i])^2 + vecc[i]) for i = 1:10)
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak6"; kwargs...)
end
